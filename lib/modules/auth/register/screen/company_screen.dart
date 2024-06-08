import 'package:auto_size_text/auto_size_text.dart';
import 'package:chamcong/core/constants/asset_path.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/core/widget/button_auth.dart';
import 'package:chamcong/core/widget/button_navigator.dart';
import 'package:chamcong/core/widget/input_onchange/input_onchange.dart';

import 'package:flutter/material.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key, required bool isCompany});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  Map<String, TextEditingController> mapControllers = {
    'account': TextEditingController(),
    'companyName': TextEditingController(),
    'phone': TextEditingController(),
    'password': TextEditingController(),
    'reEnterPassword': TextEditingController(),
    'address': TextEditingController(),
  };

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            AssetPath.logoNonText,
            width: 150,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 24),
            child: AutoSizeText(
              'Đăng ký tài khoản công ty',
              textAlign: TextAlign.center,
              style: TextStyles.text20w7Primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputOnchange(
                    title: 'Tài khoản đăng nhập',
                    isTitle: true,
                    iconLabel: Icons.person,
                    placeholder: 'Nhập số điện thoại (tài khoản đăng nhập)',
                    valueInput: mapControllers['account'],
                    type: 'account',
                    formKey: _formKey,
                  ),
                  InputOnchange(
                    title: 'Tên công ty',
                    isTitle: true,
                    iconLabel: Icons.apartment,
                    placeholder: 'Nhập tên công ty',
                    valueInput: mapControllers['companyName'],
                    type: 'company',
                    formKey: _formKey,
                  ),
                  InputOnchange(
                    title: 'Số điện thoại liên hệ',
                    isTitle: true,
                    iconLabel: Icons.phone,
                    placeholder: 'Nhập số điện thoại',
                    valueInput: mapControllers['phone'],
                    type: 'phone',
                    formKey: _formKey,
                  ),
                  InputOnchange(
                    title: 'Mật khẩu',
                    isTitle: true,
                    iconLabel: Icons.lock,
                    placeholder: 'Nhập mật khẩu',
                    isPassword: true,
                    valueInput: mapControllers['password'],
                    type: 'password',
                    formKey: _formKey,
                  ),
                  InputOnchange(
                    title: 'Nhập lại mật khẩu',
                    isTitle: true,
                    iconLabel: Icons.lock,
                    placeholder: 'Nhập lại mật khẩu',
                    isPassword: true,
                    valueInput: mapControllers['reEnterPassword'],
                    valuepassword: mapControllers['password'],
                    type: 'reEnterPassword',
                    formKey: _formKey,
                  ),
                  InputOnchange(
                    lines: 3,
                    title: 'Địa chỉ',
                    isTitle: true,
                    iconLabel: Icons.location_on,
                    placeholder: 'Nhập địa chỉ',
                    valueInput: mapControllers['address'],
                    type: 'address',
                    formKey: _formKey,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                ButtonAuth(
                  mapControllers: mapControllers,
                  formKey: _formKey,
                  textBtn: 'Tiếp tục',
                  submitRegister: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                const ButtonNavigator(
                    question: 'Bạn đã có tài khoản?',
                    pushNamed: '/login',
                    titleArguments: 'isCompany',
                    boolArguments: true,
                    where: 'Đăng nhập')
              ],
            ),
          )
        ],
      ),
    );
  }
}
