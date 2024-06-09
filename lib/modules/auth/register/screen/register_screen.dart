import 'package:chamcong/core/widget/button_icon_back.dart';
import 'package:chamcong/modules/auth/register/screen/company_screen.dart';
import 'package:chamcong/modules/auth/register/screen/staff_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final bool isCompany;
  const RegisterScreen({super.key, required this.isCompany});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              widget.isCompany
                  ? CompanyScreen(isCompany: widget.isCompany)
                  : StaffScreen(isCompany: widget.isCompany),
              const ButtonIconBack(),
            ],
          ),
        ));
  }
}
