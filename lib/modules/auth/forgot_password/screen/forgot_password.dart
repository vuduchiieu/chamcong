import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/widget/button_login.dart';
import 'package:chamcong/widget/button_navigator.dart';
import 'package:chamcong/widget/icon_button_back.dart';
import 'package:chamcong/widget/input_onchange.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    const Text(
                      'Quên mật khẩu?',
                      style: TextStyles.text26w7Primary,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const InputOnchange(
                            iconLabel: Icons.person,
                            isTitle: true,
                            title: 'Tài khoản đăng nhập',
                            placeholder: 'Nhập số điện thoại/ email',
                          ),
                          const ButtonLogin(textBtn: 'Nhập mã xác thực'),
                          ButtonNavigator(
                              question: 'Bạn chưa có tài khoản?',
                              pushNamed: '/register',
                              titleArguments: 'isCompany',
                              boolArguments: isCompany ? true : false,
                              where: 'Đăng ký')
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          IconButtonBack(
            where: '/login',
            titleArguments: 'isCompany',
            boolArguments: isCompany,
          )
        ],
      )),
    );
  }
}