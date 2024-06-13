import 'package:auto_size_text/auto_size_text.dart';
import 'package:chamcong/core/constants/asset_path.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/core/widget/button_auth/button_auth.dart';
import 'package:chamcong/core/widget/button_auth/handle_getInfo_company.dart';
import 'package:chamcong/core/widget/button_navigator.dart';
import 'package:chamcong/core/widget/input_onchange.dart';
import 'package:flutter/material.dart';

class StaffScreen extends StatefulWidget {
  final bool isCompany;
  final bool? isFormLoginScreen;
  const StaffScreen(
      {super.key, required this.isCompany, this.isFormLoginScreen});

  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.9,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
                flex: 10,
                child: AutoSizeText(
                  'Đăng ký tài khoản nhân viên',
                  textAlign: TextAlign.center,
                  style: TextStyles.text20w7Primary,
                ),
              ),
              const Spacer(
                flex: 3,
              ),
              Flexible(
                flex: 10,
                child: InputOnchange(
                  valueInput: _textEditingController,
                  title: 'Nhập ID công ty (do nhân sự cấp)',
                  isSelect: false,
                  iconLabel: Icons.info_rounded,
                  isTitle: true,
                  placeholder: 'Nhập ID công ty',
                ),
              ),
              Flexible(
                  flex: 10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonAuth(
                        textBtn: 'Xác thực mã công ty',
                        voidCallback: () {
                          handleGetInfoCompanyById(
                              context: context,
                              idCompany: _textEditingController.text);
                        },
                      ),
                      Flexible(
                          child: ButtonNavigator(
                              question: 'Bạn đã có tài khoản?',
                              pushNamed: '/login',
                              titleArguments: 'isCompany',
                              arguments: widget.isCompany ? true : false,
                              where: 'Đăng nhập'))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
