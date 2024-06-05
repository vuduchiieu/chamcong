import 'package:auto_size_text/auto_size_text.dart';
import 'package:chamcong/core/constants/asset_path.dart';
import 'package:chamcong/core/theme/colors.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/modules/auth/login/screen/border_painter.dart';
import 'package:chamcong/widget/button_login.dart';
import 'package:chamcong/widget/button_navigator.dart';
import 'package:chamcong/widget/icon_button_back.dart';
import 'package:chamcong/widget/input_onchange.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPhoneEmail = true;

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    bool isCompany = arguments['isCompany'];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.90,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 30,
                      child: Image.asset(
                        AssetPath.logoNonText,
                        width: 150,
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    Flexible(
                      flex: 5,
                      child: AutoSizeText(
                        'Đăng nhập tài khoản ${isCompany ? 'công ty' : 'nhân viên'}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Flexible(
                      flex: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          selectPhoneEmailorQR(
                              title: 'số đt/email',
                              boolean: true,
                              isSelect: _isPhoneEmail),
                          selectPhoneEmailorQR(
                              title: 'quét mã qr',
                              boolean: false,
                              isSelect: !_isPhoneEmail),
                        ],
                      ),
                    ),
                    _isPhoneEmail ? screenPhoneEmail(isCompany) : screenQr()
                  ],
                ),
              ),
            ),
            const IconButtonBack(
              where: '/select-auth',
              titleArguments: 'isRegister',
              boolArguments: false,
            )
          ],
        ),
      ),
    );
  }

  Widget selectPhoneEmailorQR(
      {required String title, required bool boolean, required bool isSelect}) {
    return GestureDetector(
        onTap: () {
          setState(() {
            _isPhoneEmail = boolean;
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title.toUpperCase(),
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: isSelect ? AppColors.primary : null),
            ),
            const SizedBox(height: 7),
            isSelect
                ? Container(
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    height: 2,
                    width: MediaQuery.of(context).size.width * 0.36,
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width * 0.36,
                  )
          ],
        ));
  }

  Widget screenPhoneEmail(bool isCompany) {
    return Flexible(
      flex: 45,
      child: Column(
        children: [
          Expanded(
            flex: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const InputOnchange(
                  iconLabel: Icons.person,
                  placeholder: 'Nhập số điện thoại/ email',
                  isTitle: false,
                ),
                const InputOnchange(
                  iconLabel: Icons.lock,
                  placeholder: 'Nhập mật khẩu',
                  isPassword: true,
                  isTitle: false,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/forgot-password',
                      arguments: {'isCompany': isCompany}),
                  child: const Text('Quên mật khẩu?',
                      style: TextStyles.text16w500UnderItaPrimary),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 5,
          ),
          Expanded(
            flex: 35,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const ButtonLogin(textBtn: 'Đăng nhập'),
                ButtonNavigator(
                    question: 'Bạn chưa có tài khoản?',
                    pushNamed: '/register',
                    titleArguments: 'isCompany',
                    boolArguments: isCompany ? true : false,
                    where: 'Đăng ký')
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget screenQr() {
    return Flexible(
        flex: 45,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 230,
                width: 230,
                color: Colors.pink[100],
                child: CustomPaint(foregroundPainter: BorderPainter()),
              ),
              const Text(
                'Hướng dẫn quét',
                style: TextStyles.text16w500Primary,
              )
            ]));
  }
}