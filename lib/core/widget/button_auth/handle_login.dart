import 'package:chamcong/core/api/api.dart';
import 'package:chamcong/core/constants/handle_api.dart';
import 'package:chamcong/core/constants/show_dia_log.dart';
import 'package:chamcong/core/models/info_user_company.dart';
import 'package:chamcong/core/models/info_user_staff.dart';
import 'package:chamcong/core/widget/button_auth/button_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

  final response = await handlePostApi(url: Api.apiLogin, body: {
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
    required Map<String, dynamic> data,
    required int type,
  }) async {
    if (type == 1) {
      InfoUserCompany infoUserCompany = InfoUserCompany.fromJson(data);
      handleNavigation(url: '/home-company', infoUser: infoUserCompany);
    } else {
      InfoUserStaff infoUserStaff = InfoUserStaff.fromJson(data);
      handleNavigation(url: '/home-staff', infoUser: infoUserStaff);
    }
  }

  // check xem có đi lạc không
  void checkIsCompany(data) {
    if (callByRegister != null) {
      // như tên, nếu gọi bằng hàm đăng ký thì không cần check đi lạc
      handleFetDataUser(data: data as Map<String, dynamic>, type: data['type']);
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
      handleFetDataUser(data: data as Map<String, dynamic>, type: data['type']);
    }
  }

  if (response != null) {
    checkIsCompany(response['data']['data']);
  }
}
