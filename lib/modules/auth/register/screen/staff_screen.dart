import 'package:auto_size_text/auto_size_text.dart';
import 'package:chamcong/core/constants/asset_path.dart';
import 'package:chamcong/core/theme/colors.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/widget/button_navigator.dart';
import 'package:flutter/material.dart';

class StaffScreen extends StatefulWidget {
  final bool? isCompany;
  const StaffScreen({super.key, this.isCompany});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 20,
                child: Image.asset(
                  AssetPath.logoNonText,
                  width: 150,
                ),
              ),
              const Spacer(
                flex: 2,
              ),
              const Flexible(
                flex: 5,
                child: AutoSizeText(
                  'Đăng ký tài khoản nhân viên',
                  textAlign: TextAlign.center,
                  style: TextStyles.text20w7Primary,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              boxRegisterStaff(),
              const Spacer(
                flex: 5,
              ),
              Flexible(
                  flex: 10,
                  child: ButtonNavigator(
                      question: 'Bạn đã có tài khoản?',
                      pushNamed: '/login',
                      titleArguments: 'isCompany',
                      boolArguments: widget.isCompany ?? false ? true : false,
                      where: 'Đăng nhập'))
            ],
          ),
        ),
      ),
    );
  }

  Widget boxRegisterStaff() {
    return Flexible(
      flex: 40,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width * 0.9,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                  color: AppColors.gray999, spreadRadius: 0, blurRadius: 4)
            ]),
        child: Column(
          children: [
            radioSelect(
                title: 'Bấm vào ảnh QR bên dưới để quét mã (do công ty cấp)'),
            Expanded(
              flex: 45,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Image.asset(
                  AssetPath.introSt,
                  color: Colors.transparent,
                  colorBlendMode: BlendMode.hardLight,
                ),
              ),
            ),
            radioSelect(title: 'Nhập ID công ty (do công ty cấp)'),
            input()
          ],
        ),
      ),
    );
  }

  Widget radioSelect({required String title}) {
    return Expanded(
      flex: 20,
      child: Row(
        children: [
          const Radio(value: null, groupValue: null, onChanged: null),
          Expanded(
            child: AutoSizeText(
              title,
              style: TextStyles.text16w500Black,
              maxLines: 2,
              minFontSize: 8,
            ),
          ),
        ],
      ),
    );
  }

  Widget input() {
    return Expanded(
      flex: 15,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: const TextField(
          decoration: InputDecoration(
              fillColor: Color(0xEEEEEEF1),
              filled: true,
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              isCollapsed: true,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: Color(0xEEEEEEF1))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(color: AppColors.primary)),
              hintStyle: (TextStyles.text16w4Gray),
              hintText: 'Nhập ID do công ty'),
        ),
      ),
    );
  }
}
