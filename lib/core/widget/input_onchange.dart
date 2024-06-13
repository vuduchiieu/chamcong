import 'package:chamcong/core/theme/colors.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputOnchange extends StatefulWidget {
  final String? placeholder; //text
  final bool? isPassword;
  final String? title;
  final int? lines;
  final String? type;
  final TextEditingController? valuepassword;
  final IconData iconLabel;
  final bool isTitle;
  final bool? change;
  final bool isSelect;
  final bool? isBirthday;
  final List<DropdownMenuItem<String>>? entryMenu;
  final TextEditingController? valueInput;
  final GlobalKey<FormState>? formKey;

  const InputOnchange(
      {super.key,
      this.placeholder,
      this.isPassword,
      this.title,
      this.lines,
      this.type,
      this.valuepassword,
      this.formKey,
      this.change,
      this.entryMenu,
      this.isBirthday,
      required this.isSelect,
      required this.iconLabel,
      required this.isTitle,
      this.valueInput});

  @override
  State<InputOnchange> createState() => _InputOnchangeState();
}

class _InputOnchangeState extends State<InputOnchange> {
  bool _isShowPassWord = true;
  bool _obscuraText = true;
  late DateTime dateTime;

  @override
  void initState() {
    dateTime = DateTime.now();
    super.initState();
  }

  bool validateUsername(String value) {
    Pattern pattern = r'^(?:\d{8,12}|\w+@\w+\.\w+)$';
    RegExp regex = RegExp(pattern as String);
    return !regex.hasMatch(value);
  }

  bool validatePassword(String value) {
    Pattern pattern = r'^(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}$';
    RegExp regex = RegExp(pattern as String);
    return !regex.hasMatch(value);
  }

  bool validateNumber(String value) {
    Pattern pattern = r'^\d+(\.\d+)?$';
    RegExp regex = RegExp(pattern as String);
    return !regex.hasMatch(value);
  }

  String? validate(String value) {
    switch (widget.type) {
      case 'account':
        if (validateUsername(value)) {
          return 'Vui lòng nhập email hoặc số điện thoại hợp lệ';
        }
      case 'company':
        if (value.isEmpty) {
          return 'Vui lòng nhập tên công ty';
        }
      case 'phone':
        if (validateNumber(value)) {
          return 'Số điện thoại không đúng định dạng';
        }
      case 'password':
        if (validatePassword(value)) {
          return 'Mật khẩu phải bao gồm 6 ký tự gồm ít nhất một chữ và một số';
        }
      case 'reEnterPassword':
        if (widget.valuepassword?.value.text != null &&
            widget.valuepassword!.value.text != value) {
          return 'Xác nhận lại mật khẩu không trùng khớp';
        }
      case 'address':
        if (value.isEmpty) {
          return 'Vui lòng nhập địa chỉ';
        }
      case 'username':
        if (value.isEmpty) {
          return 'Vui lòng nhập họ và tên';
        }
      case 'sex':
        if (value.isEmpty) {
          return 'Vui lòng lựa chọn giới tinh';
        }
      case 'birthday':
        if (value.isEmpty) {
          return 'Vui lòng lựa chọn ngày sinh';
        }
      case 'education':
        if (value.isEmpty) {
          return 'Vui lòng lựa chọn trình độ học vấn';
        }
      case 'marriage':
        if (value.isEmpty) {
          return 'Vui lòng lựa chọn tình trạng hôn nhân';
        }
      case 'experience':
        if (value.isEmpty) {
          return 'Vui lòng lựa chọn kinh nghiệm làm việc';
        }
      default:
        null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: widget.isTitle
          ? const EdgeInsets.symmetric(vertical: 8)
          : const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.isTitle)
            Container(
              margin: const EdgeInsets.only(bottom: 8),
              child: Row(
                children: [
                  Text(widget.title ?? ''),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    '*',
                    style: TextStyle(color: AppColors.error, fontSize: 18),
                  )
                ],
              ),
            ),
          widget.isBirthday != null
              // lịch
              ? GestureDetector(
                  onTap: () async {
                    DateTime? newDateTime = await showDatePicker(
                      context: context,
                      locale: const Locale('vi', 'VN'),
                      initialDate: widget.valueInput?.text != ''
                          ? DateFormat('dd-MM-yyyy')
                              .parse(widget.valueInput!.text)
                          : DateTime.now(),
                      firstDate: DateTime(1925),
                      lastDate: DateTime.now(),
                    );

                    if (widget.valueInput?.text != null) {
                      widget.valueInput!.text = newDateTime != null
                          ? DateFormat("dd-MM-yyyy")
                              .format(newDateTime)
                              .toString()
                          : DateFormat("dd-MM-yyyy").format(DateTime.now());
                    }
                  },
                  child: TextFormField(
                    controller: widget.valueInput,
                    enabled: false,
                    style: TextStyles.text16w4black,
                    decoration: InputDecoration(
                      hintText: widget.placeholder,
                      hintStyle: (TextStyles.text16w4Gray),
                      prefixIcon: Icon(widget.iconLabel),
                      prefixIconColor: MaterialStateColor.resolveWith(
                          (states) => states.contains(MaterialState.focused)
                              ? AppColors.primary
                              : AppColors.gray999),
                      disabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.gray999),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                  ),
                )
              : widget.isSelect
                  // select
                  ? DropdownButtonFormField<String>(
                      items: widget.entryMenu,
                      onChanged: (value) {
                        if (widget.valueInput != null && value != null) {
                          // con lợn này không có controller nên chúng tôi tự tạo ra
                          widget.valueInput!.value =
                              TextEditingValue(text: value);
                        }
                        if (widget.formKey?.currentState != null) {
                          widget.formKey!.currentState!.validate();
                        }
                      },
                      validator: (value) {
                        if (widget.valueInput?.value.text.isNotEmpty != null) {
                          return validate(widget.valueInput!.value.text);
                        } else {
                          return null;
                        }
                      },
                      style: TextStyles.text16w4black,
                      decoration: InputDecoration(
                          suffixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? AppColors.primary
                                  : AppColors.gray999),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: AppColors.primary)),
                          prefixIcon: Icon(widget.iconLabel),
                          prefixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? AppColors.primary
                                  : AppColors.gray999),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: widget.placeholder,
                          hintStyle: (TextStyles.text16w4Gray)),
                    )
                  // những input còn lại
                  : TextFormField(
                      enabled: widget.change ?? true,
                      onChanged: (value) {
                        if (widget.formKey?.currentState != null) {
                          widget.formKey!.currentState!.validate();
                        }
                      },
                      validator: (value) {
                        if (widget.valueInput?.value.text.isNotEmpty != null) {
                          return validate(widget.valueInput!.value.text);
                        } else {
                          return null;
                        }
                      },
                      controller: widget.valueInput,
                      maxLines: widget.lines ?? 1,
                      obscureText: widget.isPassword ?? false
                          ? _obscuraText
                          : !_obscuraText,
                      style: TextStyles.text16w4black,
                      decoration: InputDecoration(
                          suffixIcon: (widget.isPassword ?? false)
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _isShowPassWord = !_isShowPassWord;
                                      _obscuraText = !_obscuraText;
                                    });
                                  },
                                  child: Icon(_isShowPassWord
                                      ? Icons.visibility_off
                                      : Icons.visibility))
                              : null,
                          filled: widget.change ?? true ? false : true,
                          fillColor: Colors.grey[200],
                          suffixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? AppColors.primary
                                  : AppColors.gray999),
                          focusedBorder: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: AppColors.primary)),
                          prefixIcon: Icon(widget.iconLabel),
                          prefixIconColor: MaterialStateColor.resolveWith(
                              (states) => states.contains(MaterialState.focused)
                                  ? AppColors.primary
                                  : AppColors.gray999),
                          border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          hintText: widget.placeholder,
                          hintStyle: (TextStyles.text16w4Gray)),
                    ),
        ],
      ),
    );
  }
}
