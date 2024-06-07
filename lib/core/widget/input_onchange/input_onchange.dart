import 'package:chamcong/core/theme/colors.dart';
import 'package:chamcong/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class InputOnchange extends StatefulWidget {
  final String? placeholder;
  final bool? isPassword;
  final String? title;
  final int? lines;
  final String? type;
  final IconData iconLabel;
  final bool isTitle;
  final TextEditingController? valueInput;
  final GlobalKey<FormState>? formKey;

  const InputOnchange(
      {super.key,
      this.placeholder,
      this.isPassword,
      this.title,
      this.lines,
      this.type,
      this.formKey,
      required this.iconLabel,
      required this.isTitle,
      this.valueInput});

  @override
  State<InputOnchange> createState() => _InputOnchangeState();
}

class _InputOnchangeState extends State<InputOnchange> {
  bool _isShowPassWord = true;
  bool _obscuraText = true;

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
        if (value != '') {
          return 'Xác nhận lại mật khẩu không trùng khớp';
        }
      case 'address':
        if (value.isEmpty) {
          return 'Vui lòng nhập địa chỉ';
        }
      default:
        null;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.isTitle
          ? const EdgeInsets.symmetric(vertical: 8)
          : const EdgeInsets.symmetric(vertical: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.isTitle
              ? Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Text(widget.title!),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text(
                        '*',
                        style: TextStyle(color: AppColors.error, fontSize: 18),
                      )
                    ],
                  ),
                )
              : Container(),
          TextFormField(
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
            obscureText:
                widget.isPassword ?? false ? _obscuraText : !_obscuraText,
            style:
                const TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
            decoration: InputDecoration(
                suffixIcon: widget.isPassword ?? false
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
                suffixIconColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? AppColors.primary
                        : AppColors.gray999),
                focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: AppColors.primary)),
                prefixIcon: Icon(widget.iconLabel),
                prefixIconColor: MaterialStateColor.resolveWith((states) =>
                    states.contains(MaterialState.focused)
                        ? AppColors.primary
                        : AppColors.gray999),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                hintText: widget.placeholder,
                hintStyle: (TextStyles.text16w4Gray)),
          ),
        ],
      ),
    );
  }
}
