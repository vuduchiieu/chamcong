import 'package:auto_size_text/auto_size_text.dart';
import 'package:chamcong/core/constants/asset_path.dart';
import 'package:chamcong/core/theme/colors.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/core/widget/button_icon_back.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SelectAuth extends StatefulWidget {
  final bool isRegister;
  const SelectAuth({super.key, required this.isRegister});

  @override
  State<SelectAuth> createState() => _SelectAuthState();
}

class _SelectAuthState extends State<SelectAuth> {
  ValueNotifier<bool> isRegister = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    isRegister.value = widget.isRegister;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              const ButtonIconBack(),
              Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 35,
                      child: Image.asset(
                        AssetPath.logoNonText,
                        width: 150,
                      ),
                    ),
                    const Spacer(
                      flex: 5,
                    ),
                    Flexible(
                        flex: 15,
                        child: ValueListenableBuilder<bool>(
                          valueListenable: isRegister,
                          builder: (context, value, child) {
                            return AutoSizeText(
                              'Xin vui lòng lựa chọn tài khoản ${value ? 'đăng ký' : 'đăng nhập'}!',
                              textAlign: TextAlign.center,
                              style: TextStyles.text18w7Gray,
                              maxLines: 1,
                              minFontSize: 8,
                            );
                          },
                        )),
                    const Spacer(
                      flex: 5,
                    ),
                    Flexible(
                      flex: 30,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buttonSelect(
                              isRegister: isRegister,
                              title: 'NHÂN VIÊN',
                              icon: AssetPath.account,
                              isCompany: false),
                          buttonSelect(
                              isRegister: isRegister,
                              title: 'CÔNG TY',
                              icon: AssetPath.company,
                              isCompany: true),
                        ],
                      ),
                    ),
                    const Spacer(
                      flex: 10,
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget buttonSelect(
      {required String title,
      required String icon,
      required bool isCompany,
      required ValueNotifier<bool> isRegister}) {
    return GestureDetector(
      onTap: () async {
        await context.push(isRegister.value ? '/register' : '/login',
            extra: {'isCompany': isCompany, 'isStaffById': false});
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            border: const Border.fromBorderSide(
                BorderSide(color: AppColors.primary, width: 1)),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.1),
                spreadRadius: 0,
                blurRadius: 8,
                offset: const Offset(0, 6),
              ),
            ]),
        width: double.infinity,
        height: 65,
        child: Row(
          children: [
            SvgPicture.asset(icon),
            Container(
              margin: const EdgeInsets.only(left: 20),
              child: Text(
                title,
                style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            )
          ],
        ),
      ),
    );
  }
}
