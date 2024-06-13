import 'dart:convert';
import 'package:chamcong/core/api/api.dart';
import 'package:chamcong/core/constants/handle_api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> handleRegister({
  required formKey,
  required BuildContext context,
  required String account, //
  required String password, //
  required String companyName,
  required String phone, //
  required String address, //
  required int type,
  bool? isRegisterStaffById,
  List? listOrganize,
  String? username, //
  String? sex, //
  String? birthday, //
  String? education, //
  String? marriage, //
  String? experience, //
  String? position, //
  String? department, //
  String? idCompany, //
}) async {
  if (formKey.currentState.validate()) {
// điều huwongs
    handleNavigation({
      required String url,
    }) {
      context.push(url,
          extra: {'type': type, 'account': account, 'password': password});
    }

    List listOrganizeDetailId = [];
    if (listOrganize != null) {
      for (int i = 0; i < listOrganize.length; i++) {
        listOrganizeDetailId.addAll(listOrganize[i]['listOrganizeDetailId']);
      }
    }

    final response = (isRegisterStaffById != null && isRegisterStaffById)
        ? await handlePostApi(url: Api.apiRegisterStaff, body: {
            'phoneTK': account,
            'password': password,
            'userName': username?.trim() ?? '',
            'phone': phone,
            'com_id': idCompany,
            'listOrganizeDetailId': jsonEncode(listOrganizeDetailId),
            'organizeDetailId': department,
            'position_id': position,
            'address': address.trim(),
            'gender': sex,
            'birthday': birthday,
            'education': education,
            'startWorkingTime': '',
            'married': marriage,
            'experience': experience,
            //!Phan de tu kich hoat tai khoan api chamcong
            'from': 'chat365',
          })
        : await handlePostApi(url: Api.apiRegisterCompany, body: {
            'account': account,
            'password': password,
            'userName': companyName,
            'phone': phone,
            'address': address,
          });

    if (response != null) {
      handleNavigation(
        url: '/authentication-otp',
      );
    }
  }
}
