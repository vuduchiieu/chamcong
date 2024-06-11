import 'package:chamcong/core/api/api.dart';
import 'package:chamcong/core/constants/handle_api.dart';
import 'package:chamcong/core/widget/button_auth/handle_login.dart';
import 'package:chamcong/core/theme/colors.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonAuth extends StatefulWidget {
  final String? src; // điều hướng
  final String textBtn; // tên của nút
  final bool? isRegister; // check ấn vào đăng nhập hay đăng màn thứ 2
  final bool? submitRegister; // check ấn vào đăng nhập hay đăng ký thứ 3
  final int? type; // xác định nhân viên hay công ty
  final bool? isRegisterByIdCompany;
  final TextEditingController? idCompanyController;
  final Map<String, TextEditingController>? mapControllers;

  final GlobalKey<FormState>? formKey;

  const ButtonAuth(
      {super.key,
      this.src,
      this.formKey,
      required this.textBtn,
      this.isRegister,
      this.submitRegister,
      this.type,
      this.mapControllers,
      this.idCompanyController,
      this.isRegisterByIdCompany});

  @override
  State<ButtonAuth> createState() => _ButtonAuthState();
}

Future<void> handleRegister({
  required formKey,
  required ButtonAuth widget,
  required BuildContext context,
}) async {
  if (formKey.currentState.validate()) {
    String account = widget.mapControllers?['account'] != null
        ? widget.mapControllers!['account']!.text
        : '';
    String password = widget.mapControllers?['reEnterPassword'] != null
        ? widget.mapControllers!['reEnterPassword']!.text
        : '';
    String companyName = widget.mapControllers?['companyName'] != null
        ? widget.mapControllers!['companyName']!.text
        : '';
    String phone = widget.mapControllers?['phone'] != null
        ? widget.mapControllers!['phone']!.text
        : '';
    String address = widget.mapControllers?['address'] != null
        ? widget.mapControllers!['address']!.text
        : '';
// điều huwongs
    handleNavigation({
      required String url,
    }) {
      context.push(url, extra: {
        'widget': widget,
        'type': widget.type,
        'account': account,
        'password': password
      });
    }

    final response = await handlePostApi(url: Api.apiRegisterCompany, body: {
      'account': account,
      'password': password,
      'userName': companyName,
      'phone': phone,
      'address': address,
    });

    if (response != null) {
      handleNavigation(
        url: '/authentication-otp',
      ); // chờ xử lý trang otp
    }
    ;
  }
}

//gọi api lấy thông tin công ty
Future<void> handleGetInfoCompanyById(
    {required BuildContext context, required String idCompany}) async {
  final response = await handlePostApi(
      url: Api.apiCheckIdCompany, body: {'com_id': idCompany});
  if (response != null) {
    if (!context.mounted) return;
    context.push('/register', extra: {
      'isCompany': true,
      'isStaffById': true,
      'infoCompany': response['data'],
    });
  }
}

class _ButtonAuthState extends State<ButtonAuth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: () {
          // không xử lý gì cả 2 nut ở màn intro
          if (widget.src != null && widget.isRegister != null) {
            context.push(widget.src!, extra: widget.isRegister);
            return;
          }
          // xử lý thông tin công ty
          if (widget.isRegisterByIdCompany != null &&
              widget.isRegisterByIdCompany == true) {
            handleGetInfoCompanyById(
                context: context,
                idCompany: widget.idCompanyController?.text ?? "");
            return;
          }
          if (widget.submitRegister == null) {
            return;
          }
          // xử lý đăng ký đăng nhập
          if (widget.submitRegister ?? false) {
            handleRegister(
                formKey: widget.formKey, context: context, widget: widget);
          } else {
            handleLogin(context: context, widget: widget);
          }
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColors.primary),
          iconSize: MaterialStatePropertyAll(50),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)))),
        ),
        child: Text(widget.textBtn, style: TextStyles.text16w7white),
      ),
    );
  }
}
