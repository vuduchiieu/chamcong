import 'package:chamcong/core/theme/colors.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/core/widget/button_auth/button_auth.dart';
import 'package:flutter/material.dart';

toggleShowDiaLog(
    {required BuildContext context,
    required ButtonAuth widget,
    required handleFetDataUser,
    required data}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actionsPadding: const EdgeInsets.only(top: 18, right: 16, bottom: 26),
        contentPadding:
            const EdgeInsets.only(top: 30, bottom: 10, left: 20, right: 20),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(22))),
        content: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(style: TextStyles.text16w4Gray, children: <TextSpan>[
            const TextSpan(
              text: 'Tài khoản bạn đang đăng nhập là tài khoản ',
            ),
            TextSpan(
              text: "${widget.type == 1 ? 'công ty' : 'nhân viên'}. ",
              style: TextStyles.text16w500Primary,
            ),
            const TextSpan(
              text: 'Bạn có muốn tiếp tục đăng nhập với loại tài khoản này?',
            )
          ]),
        ),
        actions: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(999)),
            child: GestureDetector(
              child: const Text(
                'Quay lại',
                style: TextStyles.text16w7white,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
                color: AppColors.error,
                borderRadius: BorderRadius.circular(999)),
            child: GestureDetector(
              child: const Text(
                'Tiếp tục',
                style: TextStyles.text16w7white,
              ),
              onTap: () {
                handleFetDataUser(
                    response: data as Map<String, dynamic>, type: data['type']);
              },
            ),
          ),
        ],
      );
    },
  );
}
