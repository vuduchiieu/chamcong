import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/core/widget/button_auth/button_auth.dart';
import 'package:chamcong/core/widget/button_navigator.dart';
import 'package:chamcong/core/widget/button_icon_back.dart';
import 'package:chamcong/core/widget/input_onchange/input_onchange.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  final bool isCompany;
  const ForgotPassword({super.key, required this.isCompany});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.90,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Spacer(
                    flex: 20,
                  ),
                  const Flexible(
                    flex: 10,
                    child: Text(
                      'Quên mật khẩu?',
                      style: TextStyles.text26w7Primary,
                    ),
                  ),
                  const Flexible(
                    flex: 20,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Bạn đã quên mật khẩu?',
                          style: TextStyles.text16w500Black,
                        ),
                        Text(
                          'Hãy nhập số điện thoại hoặc email đăng nhập của bạn. Chúng tôi sẽ gửi tới tài khoản của bạn mã xác thực để lấy lại mật khẩu',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 30,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const InputOnchange(
                          isSelect: false,
                          iconLabel: Icons.person,
                          isTitle: true,
                          title: 'Tài khoản đăng nhập',
                          placeholder: 'Nhập số điện thoại/ email',
                        ),
                        const ButtonAuth(
                            textBtn: 'Nhập mã xác thực', submitRegister: null),
                        ButtonNavigator(
                            question: 'Bạn chưa có tài khoản?',
                            pushNamed: '/register',
                            titleArguments: 'isCompany',
                            arguments: widget.isCompany ? true : false,
                            where: 'Đăng ký')
                      ],
                    ),
                  ),
                  const Spacer(
                    flex: 20,
                  )
                ],
              ),
            ),
          ),
          const ButtonIconBack()
        ],
      )),
    );
  }
}
