import 'package:chamcong/modules/auth/forgot_password/screen/forgot_password.dart';
import 'package:chamcong/modules/auth/intro_auth/screen/intro_auth_screen.dart';
import 'package:chamcong/modules/auth/login/screen/login_screen.dart';
import 'package:chamcong/modules/auth/register/screen/register_screen.dart';
import 'package:chamcong/modules/auth/select_auth/screen/select_auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      routes: {
        '/': (context) => const IntroAuth(),
        '/select-auth': (context) => const SelectAuth(),
        '/login': (context) => const LoginScreen(),
        '/forgot-password': (context) => const ForgotPassword(),
        '/register': (context) => const RegisterScreen()
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
