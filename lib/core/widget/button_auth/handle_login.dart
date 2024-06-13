import 'package:chamcong/core/api/api.dart';
import 'package:chamcong/core/constants/handle_api.dart';
import 'package:chamcong/core/constants/show_dia_log.dart';
import 'package:chamcong/models/info_user_company.dart';
import 'package:chamcong/models/info_user_staff.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> handleLogin({
  required int type,
  required BuildContext context,
  bool? callByRegister, // gọi ở phần đăng ký, không cần check đi lạc
  required String account,
  required String password,
}) async {
  final response = await handlePostApi(url: Api.apiLogin, body: {
    'account': account,
    'password': password,
    'type': type,
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
    if (type != data['type']) {
      // đi lạc thì hiện cảnh báo
      toggleShowDiaLog(
          context: context,
          type: type,
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
