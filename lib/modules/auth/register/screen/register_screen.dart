import 'package:chamcong/core/widget/button_icon_back.dart';
import 'package:chamcong/modules/auth/register/screen/form_register.dart';
import 'package:chamcong/modules/auth/register/screen/staff/staff_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  final Map<String, dynamic> argument;
  const RegisterScreen({super.key, required this.argument});

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
              widget.argument['isCompany']
                  ? CompanyScreen(
                      isCompany: widget.argument['isCompany'],
                      isRegisterStaffById:
                          widget.argument['isRegisterStaffById'],
                      infoCompany: widget.argument['infoCompany'],
                    )
                  : StaffScreen(isCompany: widget.argument['isCompany']),
              const ButtonIconBack(),
            ],
          ),
        ));
  }
}
