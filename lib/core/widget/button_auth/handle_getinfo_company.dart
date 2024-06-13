import 'package:chamcong/core/api/api.dart';
import 'package:chamcong/core/constants/handle_api.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<void> handleGetInfoCompanyById(
    {required BuildContext context, required String idCompany}) async {
  final response = await handlePostApi(
      url: Api.apiCheckIdCompany, body: {'com_id': idCompany});
  if (response != null) {
    if (!context.mounted) return;
    context.push('/register', extra: {
      'isCompany': true,
      'isRegisterStaffById': true,
      'infoCompany': response['data'],
    });
  }
}
