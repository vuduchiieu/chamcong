import 'package:chamcong/core/constants/handle_api.dart';
import 'package:chamcong/core/constants/show_dia_log.dart';
import 'package:chamcong/core/models/info_user_staff.dart';
import 'package:chamcong/core/theme/colors.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/core/models/info_user_company.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonAuth extends StatefulWidget {
  final String? src; // điều hướng
  final String textBtn; // tên của nút
  final bool? isRegister; // check ấn vào đăng nhập hay đăng màn thứ 2
  final bool? submitRegister; // check ấn vào đăng nhập hay đăng ký thứ 3
  final int? type; // xác định nhân viên hay công ty
  final Map<String, TextEditingController>? mapControllers;

  final GlobalKey<FormState>? formKey;

  const ButtonAuth({
    super.key,
    this.src,
    this.formKey,
    required this.textBtn,
    this.isRegister,
    this.submitRegister,
    this.type,
    this.mapControllers,
  });

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
    Future handleNavigation({
      required String url,
    }) async {
      await context.push(url, extra: {'type': widget.type, 'account': account});
    }

    final response = await handlePostApi(body: {
      // 'account': account,
      'password': password,
      'userName': companyName,
      'phone': phone,
      'address': address,
    });

    if (response != null) {
      await handleNavigation(
        url: '/authentication-otp',
      ); // chờ xử lý trang otp
      if (!context.mounted) return;
      //gọi hàm đăng nhập
      handleLogin(
          widget: widget,
          context: context,
          callByRegister: true,
          accountValue: account,
          passwordValue: password);
    }
    ;
  }
}

Future<void> handleLogin({
  required ButtonAuth widget,
  required BuildContext context,
  bool? callByRegister,
  String? accountValue,
  String? passwordValue,
}) async {
  String account;
  String password;

  if (callByRegister != null && callByRegister == true) {
    account = accountValue ?? '';
    password = passwordValue ?? '';
  } else {
    account = widget.mapControllers?['account'] != null
        ? widget.mapControllers!['account']!.text
        : '';
    password = widget.mapControllers?['password'] != null
        ? widget.mapControllers!['password']!.text
        : '';
  }

  final response = await handlePostApi(body: {
    'account': account,
    'password': password,
    'type': widget.type,
  });

  // điều hướng(cho ra ngoài đỡ báo xanh)
  void handleNavigation({required String url, required infoUser}) {
    context.push(url, extra: infoUser);
  }

  // lấy thông tin người dùng gán vào đối tượng rồi điều hướng
  void handleFetDataUser({
    required response,
    required int type,
  }) async {
    if (type == 1) {
      InfoUserCompany infoUserCompany = InfoUserCompany.fromJson(response);
      handleNavigation(url: '/home-company', infoUser: infoUserCompany);
    } else {
      InfoUserStaff infoUserStaff = InfoUserStaff.fromJson(response);
      handleNavigation(url: '/home-staff', infoUser: infoUserStaff);
    }
  }

  // check xem có đi lạc không
  void checkIsCompany(data) {
    if (callByRegister != null) {
      // như tên, nếu gọi bằng hàm đăng ký thì không cần check đi lạc
      handleFetDataUser(
          response: data as Map<String, dynamic>, type: data['type']);
      return;
    }
    if (widget.type != data['type']) {
      // đi lạc thì hiện cảnh báo
      toggleShowDiaLog(
          context: context,
          widget: widget,
          handleFetDataUser: handleFetDataUser,
          data: data);
    } else {
      handleFetDataUser(
          response: data as Map<String, dynamic>, type: data['type']);
    }
  }

  if (response != null) {
    checkIsCompany(response['data']['data']);
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
          if (widget.src != null && widget.isRegister != null) {
            context.push(widget.src!, extra: widget.isRegister);
            return;
          }
          if (widget.submitRegister == null) {
            return;
          }
          if (widget.submitRegister!) {
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
