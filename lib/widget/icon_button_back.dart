import 'package:chamcong/core/theme/colors.dart';
import 'package:flutter/material.dart';

class IconButtonBack extends StatelessWidget {
  final String where;
  final String? titleArguments;
  final bool? boolArguments;
  const IconButtonBack(
      {super.key,
      required this.where,
      this.titleArguments,
      this.boolArguments});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 10,
      child: IconButton(
        onPressed: () {
          if (titleArguments == 'isRegister') {
            Navigator.popUntil(context, (route) {
              if (route.settings.name == where &&
                  route.settings.arguments is Map &&
                  (route.settings.arguments as Map)
                      .containsKey(titleArguments)) {
                (route.settings.arguments as Map)[titleArguments] =
                    boolArguments;
                return true;
              }
              return false;
            });
          } else {
            Navigator.pop(context);
          }
        },
        icon: const Icon(Icons.arrow_back_ios_new),
        color: AppColors.primary,
      ),
    );
  }
}
