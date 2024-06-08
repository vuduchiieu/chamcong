import 'dart:convert';
import 'package:chamcong/core/api/api.dart';
import 'package:chamcong/core/models/info_user_staff.dart';
import 'package:chamcong/core/theme/colors.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/core/models/info_user_company.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

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
    // điều hướng(cho ra ngoài đỡ báo xanh)
    handleNavigation({required String url}) {
      Navigator.pushNamed(context, url);
    }

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

    final fetData = await http.post(Uri.parse(Api.apiRegisterCompany),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'account': account,
          'password': password,
          'userName': companyName,
          'phone': phone,
          'address': address,
        }));

    final response = jsonDecode(fetData.body);

    if (fetData.statusCode == 200) {
    } else {
      //Be trả về lỗi thì hiển thị message lên giao diện người dùng
      handleNavigation(url: '/authentication-otp');

      Fluttertoast.showToast(
          msg: response['error']['message'] ?? "Lỗi không xác định",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: AppColors.error,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
}

Future<void> handleLogin({
  required ButtonAuth widget,
  required BuildContext context,
}) async {
  String account = widget.mapControllers?['account'] != null
      ? widget.mapControllers!['account']!.text
      : '';
  String password = widget.mapControllers?['password'] != null
      ? widget.mapControllers!['password']!.text
      : '';

  final fetData = await http.post(Uri.parse(Api.apiLogin),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'account': account,
        'password': password,
        'type': widget.type,
      }));

  final response = jsonDecode(fetData.body);

  // điều hướng(cho ra ngoài đỡ báo xanh)
  void handleNavigation({required String url, required infoUser}) {
    Navigator.pushNamed(context, url, arguments: {'infoUser': infoUser});
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
    if (widget.type != data['type']) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            actionsPadding:
                const EdgeInsets.only(top: 18, right: 16, bottom: 26),
            contentPadding:
                const EdgeInsets.only(top: 30, bottom: 10, left: 20, right: 20),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(22))),
            content: RichText(
              textAlign: TextAlign.center,
              text:
                  TextSpan(style: TextStyles.text16w4Gray, children: <TextSpan>[
                const TextSpan(
                  text: 'Tài khoản bạn đang đăng nhập là tài khoản ',
                ),
                TextSpan(
                  text: "${widget.type == 1 ? 'công ty' : 'nhân viên'}. ",
                  style: TextStyles.text16w500Primary,
                ),
                const TextSpan(
                  text:
                      'Bạn có muốn tiếp tục đăng nhập với loại tài khoản này?',
                )
              ]),
            ),
            actions: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(999)),
                child: GestureDetector(
                  child: const Text(
                    'Quay lại',
                    style: TextStyles.text16w7white,
                  ),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                    color: AppColors.error,
                    borderRadius: BorderRadius.circular(999)),
                child: GestureDetector(
                  child: const Text(
                    'Tiếp tục',
                    style: TextStyles.text16w7white,
                  ),
                  onTap: () {
                    handleFetDataUser(
                        response: data as Map<String, dynamic>,
                        type: data['type']);
                  },
                ),
              ),
            ],
          );
        },
      );
    } else {
      handleFetDataUser(
          response: data as Map<String, dynamic>, type: data['type']);
    }
  }

  if (fetData.statusCode == 200) {
    checkIsCompany(response['data']['data']);
  } else {
    //Be trả về lỗi thì hiển thị message lên giao diện người dùng
    Fluttertoast.showToast(
        msg: response['error']['message'] ?? "Lỗi không xác định",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor: AppColors.error,
        textColor: Colors.white,
        fontSize: 16.0);
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
            Navigator.pushNamed(context, widget.src!,
                arguments: {'isRegister': widget.isRegister});
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
