import 'package:chamcong/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ButtonIconBack extends StatelessWidget {
  const ButtonIconBack({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 15,
      child: GestureDetector(
        onTap: () {
          context.pop(true);
        },
        child: const Icon(Icons.arrow_back_ios_new, color: AppColors.primary),
      ),
    );
  }
}
