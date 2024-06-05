import 'package:chamcong/core/theme/colors.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static const TextStyle text16w4Gray = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Color(0xFF666666),
    height: 22 / 16,
  );

  static const TextStyle text16w4black = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.black,
    height: 22 / 16,
  );

  static const TextStyle text16w500UnderItaPrimary = TextStyle(
    height: 22 / 16,
    fontSize: 16,
    decoration: TextDecoration.underline,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
    color: AppColors.primary,
  );

  static const TextStyle text16w500Primary = TextStyle(
    height: 22 / 16,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );

  static const TextStyle text16w500Black = TextStyle(
    height: 22 / 16,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static const TextStyle text16w7white = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: Colors.white,
  );

  static const TextStyle text18w7Gray = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: Color(0xFF666666),
    height: 22 / 16,
  );

  static const TextStyle text18w7Primary = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    height: 22 / 16,
  );
  static const TextStyle text20w7Primary = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    height: 22 / 16,
  );

  static const TextStyle text26w7Primary = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.primary,
    height: 22 / 16,
  );
}
