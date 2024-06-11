import 'package:auto_size_text/auto_size_text.dart';
import 'package:chamcong/core/constants/asset_path.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:chamcong/core/widget/button_auth/button_auth.dart';
import 'package:chamcong/core/widget/button_navigator.dart';
import 'package:chamcong/core/widget/input_onchange/input_onchange.dart';

import 'package:flutter/material.dart';

class CompanyScreen extends StatefulWidget {
  final bool isCompany;
  final bool isStaffById;
  final Map<String, dynamic>? infoCompany;
  const CompanyScreen(
      {super.key,
      required this.isCompany,
      required this.isStaffById,
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
          text: widget.isStaffById
              ? widget.infoCompany!['detail_company']['com_name']
              : ''),
      'phone': TextEditingController(),
      'password': TextEditingController(),
      'reEnterPassword': TextEditingController(),
      'address': TextEditingController(),
      'username': TextEditingController(),
      'sex': TextEditingController(),
      'birthday': TextEditingController(),
      'academic': TextEditingController(),
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
              widget.isStaffById
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
                  mapControllers: mapControllers,
                  formKey: _formKey,
                  textBtn: 'Tiếp tục',
                  submitRegister: true,
                  type: widget.isCompany ? 2 : 1,
                ),
                const SizedBox(
                  height: 10,
                ),
                if (!widget.isStaffById)
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
    List<Map<String, dynamic>> listPositions = [];
    if (widget.infoCompany?['list_position'] is List &&
        (widget.infoCompany?['list_position'] as List).isNotEmpty) {
      listPositions = widget.infoCompany!['list_positions'];
    }

    List<Map<String, dynamic>> listOrganizeDetail = [];
    if (widget.infoCompany?['list_organizeDetail'] is List &&
        (widget.infoCompany!['list_organizeDetail'] as List).isNotEmpty) {
      listOrganizeDetail = widget.infoCompany!['list_organizeDetail'];
    }

    List<String> sex = ['Nam', 'Nữ', 'Khác'];
    List<String> academic = [
      'Trên đại học',
      'Đại học',
      'Cao đẳng',
      'Trung cấp',
      'Đào tạo nghề',
      'Trung học phổ thông',
      'Trung học cơ sở',
      'Tiểu học'
    ];
    List<String> marriage = ['Độc thân', 'Đã kết hôn'];

    List<String> experience = [
      'Chưa có kinh nghiệm',
      'Dưới 1 năm',
      '1 năm',
      '2 năm',
      '3 năm',
      '4 năm',
      '5 năm',
      'Trên 5 năm'
    ];

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
          change: widget.isStaffById ? false : true,
          title: 'Tên công ty',
          isTitle: true,
          iconLabel: Icons.apartment,
          placeholder: 'Nhập tên công ty',
          valueInput: mapControllers['companyName'],
          type: 'company',
          formKey: _formKey,
        ),
        if (widget.isStaffById)
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
          lines: widget.isStaffById ? 1 : 3,
          title: 'Địa chỉ',
          isTitle: true,
          iconLabel: Icons.location_on,
          placeholder: 'Nhập địa chỉ',
          valueInput: mapControllers['address'],
          type: 'address',
          formKey: _formKey,
        ),
        //  mấy cái dưới này là input cho đăng ký nhân viên
        if (widget.isStaffById)
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
              sex.length,
              (index) =>
                  DropdownMenuEntry(value: sex[index], label: sex[index]),
            ),
          ),
        if (widget.isStaffById)
          InputOnchange(
            isSelect: true,
            title: 'Ngày sinh',
            isTitle: true,
            iconLabel: Icons.calendar_month,
            valueInput: mapControllers['birthday'],
            type: 'birthday',
            formKey: _formKey,
            isBirthday: true,
          ),
        if (widget.isStaffById)
          InputOnchange(
              isSelect: true,
              title: 'Trình độ học vấn',
              isTitle: true,
              iconLabel: Icons.school,
              valueInput: mapControllers['academic'],
              type: 'academic',
              placeholder: 'Chọn trình độ học vấn',
              formKey: _formKey,
              entryMenu: List.generate(
                  academic.length,
                  (index) => DropdownMenuEntry(
                      value: academic[index], label: academic[index]))),
        if (widget.isStaffById)
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
                  marriage.length,
                  (index) => DropdownMenuEntry(
                      value: marriage[index], label: marriage[index]))),
        if (widget.isStaffById)
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
                  experience.length,
                  (index) => DropdownMenuEntry(
                      value: experience[index], label: experience[index]))),

        if (widget.isStaffById)
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
              return DropdownMenuEntry<String>(
                  value: (position['positionName']),
                  label: position['positionName']);
            }).toList(),
          ),
        if (widget.isStaffById)
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
              return DropdownMenuEntry<String>(
                  value: (organizeDetai['organizeDetailName']),
                  label: organizeDetai['organizeDetailName']);
            }).toList(),
          ),
      ],
    );
  }
}
