import 'package:chamcong/core/widget/icon_button_back.dart';
import 'package:chamcong/modules/auth/register/screen/company_screen.dart';
import 'package:chamcong/modules/auth/register/screen/staff_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
