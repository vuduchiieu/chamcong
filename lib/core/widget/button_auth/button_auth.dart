import 'package:chamcong/core/theme/colors.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonAuth extends StatefulWidget {
  final String? src; // điều hướng
  final String textBtn; // tên của nút
  final bool? isRegister; // check ấn vào đăng nhập hay đăng màn thứ 2
  final VoidCallback? voidCallback;

  final GlobalKey<FormState>? formKey;

  const ButtonAuth({
    super.key,
    this.src,
    this.formKey,
    required this.textBtn,
    this.isRegister,
    this.voidCallback,
  });

  @override
  State<ButtonAuth> createState() => _ButtonAuthState();
}

class _ButtonAuthState extends State<ButtonAuth> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ElevatedButton(
        onPressed: () {
          // không xử lý gì cả 2 nut ở màn intro
          if (widget.src != null && widget.isRegister != null) {
            context.push(widget.src!, extra: widget.isRegister);
            return;
          }

          if (widget.voidCallback != null) {
            widget.voidCallback!();
          }
        },
        style: const ButtonStyle(
          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 10)),
          backgroundColor: MaterialStatePropertyAll(AppColors.primary),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)))),
        ),
        child: Text(widget.textBtn, style: TextStyles.text16w7white),
      ),
    );
  }
}
