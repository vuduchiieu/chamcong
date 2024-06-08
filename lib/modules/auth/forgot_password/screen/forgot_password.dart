import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/core/widget/button_auth.dart';
import 'package:chamcong/core/widget/button_navigator.dart';
import 'package:chamcong/core/widget/button_icon_back.dart';
import 'package:chamcong/core/widget/input_onchange/input_onchange.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isCompany = false;

  @override
  void didChangeDependencies() {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    isCompany = arguments['isCompany'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
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
                          InputOnchange(
                            iconLabel: Icons.person,
                            isTitle: true,
                            title: 'Tài khoản đăng nhập',
                            placeholder: 'Nhập số điện thoại/ email',
                          ),
                          const ButtonAuth(
                              textBtn: 'Nhập mã xác thực',
                              submitRegister: null),
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
          ButtonIconBack(
            where: '/login',
            titleArguments: 'isCompany',
            boolArguments: isCompany,
          )
        ],
      )),
    );
  }
}
