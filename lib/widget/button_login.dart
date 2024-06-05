import 'package:chamcong/core/theme/colors.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class ButtonLogin extends StatefulWidget {
  final String? src;
  final String textBtn;
  final bool? isRegister;

  const ButtonLogin(
      {super.key, this.src, required this.textBtn, this.isRegister});

  @override
  State<ButtonLogin> createState() => _ButtonLoginState();
}

class _ButtonLoginState extends State<ButtonLogin> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: () {
          if (widget.src != null) {
            Navigator.pushNamed(context, widget.src!,
                arguments: {'isRegister': widget.isRegister});
          }
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(AppColors.primary),
          iconSize: MaterialStatePropertyAll(50),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)))),
        ),
        child: Text(widget.textBtn, style: TextStyles.text16w7white),
      ),
    );
  }
}
