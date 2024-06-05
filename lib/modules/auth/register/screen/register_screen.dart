import 'package:chamcong/modules/auth/register/screen/company_screen.dart';
import 'package:chamcong/modules/auth/register/screen/staff_screen.dart';
import 'package:chamcong/widget/icon_button_back.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
              isCompany
                  ? CompanyScreen(isCompany: isCompany)
                  : StaffScreen(isCompany: isCompany),
              const IconButtonBack(
                where: '/select-auth',
                titleArguments: 'isRegister',
                boolArguments: true,
              ),
            ],
          ),
        ));
  }
}
