import 'package:auto_size_text/auto_size_text.dart';
import 'package:chamcong/core/constants/asset_path.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/widget/button_login.dart';
import 'package:chamcong/widget/button_navigator.dart';
import 'package:chamcong/widget/input_onchange.dart';
import 'package:flutter/material.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key, required bool isCompany});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  Map<String, TextEditingController> mapControllers = {
    'username': TextEditingController(),
    'companyName': TextEditingController(),
    'phone': TextEditingController(),
    'password': TextEditingController(),
    'reEnterPassword': TextEditingController(),
    'address': TextEditingController(),
  };

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputOnchange(
                  title: 'Tài khoản đăng nhập',
                  isTitle: true,
                  iconLabel: Icons.person,
                  placeholder: 'Nhập số điện thoại (tài khoản đăng nhập)',
                  valueInput: mapControllers['username'],
                  type: 'username',
                ),
                InputOnchange(
                  title: 'Tên công ty',
                  isTitle: true,
                  iconLabel: Icons.apartment,
                  placeholder: 'Nhập tên công ty',
                  valueInput: mapControllers['companyName'],
                  type: 'company',
                ),
                InputOnchange(
                  title: 'Số điện thoại liên hệ',
                  isTitle: true,
                  iconLabel: Icons.phone,
                  placeholder: 'Nhập số điện thoại',
                  valueInput: mapControllers['phone'],
                ),
                InputOnchange(
                  title: 'Mật khẩu',
                  isTitle: true,
                  iconLabel: Icons.lock,
                  placeholder: 'Nhập mật khẩu',
                  isPassword: true,
                  valueInput: mapControllers['password'],
                ),
                InputOnchange(
                  title: 'Nhập lại mật khẩu',
                  isTitle: true,
                  iconLabel: Icons.lock,
                  placeholder: 'Nhập lại mật khẩu',
                  isPassword: true,
                  valueInput: mapControllers['reEnterPassword'],
                ),
                InputOnchange(
                  lines: 3,
                  title: 'Địa chỉ',
                  isTitle: true,
                  iconLabel: Icons.location_on,
                  placeholder: 'Nhập địa chỉ',
                  valueInput: mapControllers['address'],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                ButtonLogin(textBtn: 'Tiếp tục'),
                SizedBox(
                  height: 10,
                ),
                ButtonNavigator(
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
