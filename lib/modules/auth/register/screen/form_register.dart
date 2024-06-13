import 'package:auto_size_text/auto_size_text.dart';
import 'package:chamcong/core/constants/asset_path.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/core/widget/button_auth/button_auth.dart';
import 'package:chamcong/core/widget/button_auth/handle_register.dart';
import 'package:chamcong/core/widget/button_navigator.dart';
import 'package:chamcong/core/widget/input_onchange.dart';

import 'package:flutter/material.dart';

class CompanyScreen extends StatefulWidget {
  final bool isCompany;
  final bool isRegisterStaffById;
  final Map<String, dynamic>? infoCompany;
  const CompanyScreen(
      {super.key,
      required this.isCompany,
      required this.isRegisterStaffById,
      this.infoCompany});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  late Map<String, TextEditingController> mapControllers;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    mapControllers = {
      'account': TextEditingController(),
      'companyName': TextEditingController(
          text: widget.isRegisterStaffById
              ? widget.infoCompany!['detail_company']['com_name']
              : ''),
      'phone': TextEditingController(),
      'password': TextEditingController(),
      'reEnterPassword': TextEditingController(),
      'address': TextEditingController(),
      'username': TextEditingController(),
      'sex': TextEditingController(),
      'birthday': TextEditingController(),
      'education': TextEditingController(),
      'marriage': TextEditingController(),
      'experience': TextEditingController(),
      'position': TextEditingController(),
      'department': TextEditingController(),
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            AssetPath.logoNonText,
            width: 150,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: AutoSizeText(
              widget.isRegisterStaffById
                  ? 'Điền thông tin tài khoản'
                  : 'Đăng ký tài khoản công ty',
              textAlign: TextAlign.center,
              style: TextStyles.text20w7Primary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: input(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: Column(
              children: [
                ButtonAuth(
                  formKey: _formKey,
                  textBtn: 'Tiếp tục',
                  voidCallback: () {
                    handleRegister(
                        formKey: _formKey,
                        context: context,
                        isRegisterStaffById: widget.isRegisterStaffById,
                        account: mapControllers['account']?.text ?? '',
                        address: mapControllers['address']?.text ?? '',
                        companyName: mapControllers['companyName']?.text ?? '',
                        password: mapControllers['password']?.text ?? '',
                        phone: mapControllers['phone']?.text ?? '',
                        type: widget.isCompany ? 2 : 1,
                        // phần này của nhân viên
                        listOrganize:
                            widget.infoCompany?['list_organizeDetail'],
                        username: mapControllers['username']?.text ?? '',
                        sex: mapControllers['sex']?.text ?? '',
                        birthday: mapControllers['birthday']?.text ?? '',
                        education: mapControllers['education']?.text ?? '',
                        marriage: mapControllers['marriage']?.text ?? '',
                        experience: mapControllers['experience']?.text ?? '',
                        position: mapControllers['position']?.text ?? '',
                        department: mapControllers['department']?.text ?? '',
                        idCompany: widget.infoCompany!['detail_company']
                            ['com_id']);
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                if (!widget.isRegisterStaffById)
                  ButtonNavigator(
                      titleArguments: 'isCompany',
                      arguments: widget.isCompany ? true : false,
                      question: 'Bạn đã có tài khoản?',
                      pushNamed: '/login',
                      where: 'Đăng nhập')
              ],
            ),
          )
        ],
      ),
    );
  }

  Column input() {
    List listPositions = widget.infoCompany?['list_positions'] ?? [];

    List listOrganizeDetail = widget.infoCompany?['list_organizeDetail'] ?? [];

    Map<int, String> sex = {1: 'Nam', 2: 'Nữ', 3: 'Khác'};

    Map<int, String> education = {
      1: 'Trên đại học',
      2: 'Đại học',
      3: 'Cao đẳng',
      4: 'Trung cấp',
      5: 'Đào tạo nghề',
      6: 'Trung học phổ thông',
      7: 'Trung học cơ sở',
      8: 'Tiểu học'
    };

    Map<int, String> marriage = {1: 'Độc thân', 2: 'Đã kết hôn'};

    Map<int, String> experience = {
      1: 'Chưa có kinh nghiệm',
      2: 'Dưới 1 năm',
      3: '1 năm',
      4: '2 năm',
      5: '3 năm',
      6: '4 năm',
      7: '5 năm',
      8: 'Trên 5 năm'
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InputOnchange(
          isSelect: false,
          title: 'Tài khoản đăng nhập',
          isTitle: true,
          iconLabel: Icons.person,
          placeholder: 'Nhập số điện thoại (tài khoản đăng nhập)',
          valueInput: mapControllers['account'],
          type: 'account',
          formKey: _formKey,
        ),
        InputOnchange(
          isSelect: false,
          change: widget.isRegisterStaffById ? false : true,
          title: 'Tên công ty',
          isTitle: true,
          iconLabel: Icons.apartment,
          placeholder: 'Nhập tên công ty',
          valueInput: mapControllers['companyName'],
          type: 'company',
          formKey: _formKey,
        ),
        if (widget.isRegisterStaffById)
          InputOnchange(
            isSelect: false,
            title: 'Tên người dùng',
            isTitle: true,
            iconLabel: Icons.person_add_alt_1,
            placeholder: 'Nhập họ và tên',
            valueInput: mapControllers['username'],
            type: 'username',
            formKey: _formKey,
          ),
        InputOnchange(
          isSelect: false,
          title: 'Số điện thoại liên hệ',
          isTitle: true,
          iconLabel: Icons.phone,
          placeholder: 'Nhập số điện thoại',
          valueInput: mapControllers['phone'],
          type: 'phone',
          formKey: _formKey,
        ),
        InputOnchange(
          isSelect: false,
          title: 'Mật khẩu',
          isTitle: true,
          iconLabel: Icons.lock,
          placeholder: 'Nhập mật khẩu',
          isPassword: true,
          valueInput: mapControllers['password'],
          type: 'password',
          formKey: _formKey,
        ),
        InputOnchange(
          isSelect: false,
          title: 'Nhập lại mật khẩu',
          isTitle: true,
          iconLabel: Icons.lock,
          placeholder: 'Nhập lại mật khẩu',
          isPassword: true,
          valueInput: mapControllers['reEnterPassword'],
          valuepassword: mapControllers['password'],
          type: 'reEnterPassword',
          formKey: _formKey,
        ),
        InputOnchange(
          isSelect: false,
          lines: widget.isRegisterStaffById ? 1 : 3,
          title: 'Địa chỉ',
          isTitle: true,
          iconLabel: Icons.location_on,
          placeholder: 'Nhập địa chỉ',
          valueInput: mapControllers['address'],
          type: 'address',
          formKey: _formKey,
        ),
        //  mấy cái dưới này là input cho đăng ký nhân viên
        if (widget.isRegisterStaffById)
          InputOnchange(
            isSelect: true,
            title: 'Giới tính',
            isTitle: true,
            iconLabel: Icons.transgender,
            valueInput: mapControllers['sex'],
            type: 'sex',
            placeholder: 'Chọn giới tính',
            formKey: _formKey,
            entryMenu: List.generate(
              sex.values.length,
              (index) => DropdownMenuItem(
                  value: sex.keys.elementAt(index).toString(),
                  child: Text(sex.values.elementAt(index))),
            ),
          ),
        if (widget.isRegisterStaffById)
          InputOnchange(
            isSelect: true,
            title: 'Ngày sinh',
            isTitle: true,
            iconLabel: Icons.calendar_month,
            valueInput: mapControllers['birthday'],
            placeholder: 'Chọn ngày sinh',
            type: 'birthday',
            formKey: _formKey,
            isBirthday: true,
          ),
        if (widget.isRegisterStaffById)
          InputOnchange(
              isSelect: true,
              title: 'Trình độ học vấn',
              isTitle: true,
              iconLabel: Icons.school,
              valueInput: mapControllers['education'],
              type: 'education',
              placeholder: 'Chọn trình độ học vấn',
              formKey: _formKey,
              entryMenu: List.generate(
                  education.values.length,
                  (index) => DropdownMenuItem(
                      value: education.keys.elementAt(index).toString(),
                      child: Text(education.values.elementAt(index))))),
        if (widget.isRegisterStaffById)
          InputOnchange(
              isSelect: true,
              title: 'Tình trạng hôn nhân',
              isTitle: true,
              iconLabel: Icons.favorite,
              valueInput: mapControllers['marriage'],
              placeholder: 'Chọn tình trạng hôn nhân',
              type: 'marriage',
              formKey: _formKey,
              entryMenu: List.generate(
                  marriage.values.length,
                  (index) => DropdownMenuItem(
                      value: marriage.keys.elementAt(index).toString(),
                      child: Text(marriage.values.elementAt(index))))),
        if (widget.isRegisterStaffById)
          InputOnchange(
              isSelect: true,
              title: 'Kinh nghiệm làm việc',
              placeholder: 'Chọn kinh nghiệm làm việc',
              isTitle: true,
              iconLabel: Icons.work,
              valueInput: mapControllers['experience'],
              type: 'experience',
              formKey: _formKey,
              entryMenu: List.generate(
                  experience.values.length,
                  (index) => DropdownMenuItem(
                        value: experience.keys.elementAt(index).toString(),
                        child: Text(experience.values.elementAt(index)),
                      ))),

        if (widget.isRegisterStaffById)
          InputOnchange(
            isSelect: true,
            title: 'Chức vụ',
            isTitle: true,
            iconLabel: Icons.workspace_premium,
            placeholder: 'Chọn chức vụ',
            valueInput: mapControllers['position'],
            type: 'position',
            formKey: _formKey,
            entryMenu: listPositions.map((position) {
              return DropdownMenuItem<String>(
                  value: (position['position_id'].toString()),
                  child: Text(position['positionName']));
            }).toList(),
          ),
        if (widget.isRegisterStaffById)
          InputOnchange(
            isSelect: true,
            title: 'Phòng ban',
            isTitle: true,
            iconLabel: Icons.corporate_fare_rounded,
            placeholder: 'Chọn tổ chức',
            valueInput: mapControllers['department'],
            type: 'department',
            formKey: _formKey,
            entryMenu: listOrganizeDetail.map((organizeDetai) {
              return DropdownMenuItem<String>(
                  value: (organizeDetai['organizeDetailId'].toString()),
                  child: Text(organizeDetai['organizeDetailName']));
            }).toList(),
          ),
      ],
    );
  }
}
