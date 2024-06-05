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
  const InputOnchange(
      {super.key,
      this.placeholder,
      this.isPassword,
      this.title,
      this.lines,
      this.type,
      required this.iconLabel,
      required this.isTitle,
      this.valueInput});

  @override
  State<InputOnchange> createState() => _InputOnchangeState();
}

class _InputOnchangeState extends State<InputOnchange> {
  bool _isShowPassWord = true;
  bool _obscuraText = true;

  String? validate(String value) {
    switch (widget.type) {
      case 'username':
        Pattern pattern = r'^\d+(?:\.\d+)?$';
        RegExp regex = RegExp(pattern.toString());
        if (!regex.hasMatch(value)) {
          return 'Số điện thoại không chứa ký tự đặc biệt';
        }
      case 'company':
        Pattern pattern = r'/^[a-zA-Z0-9]*$/';
        RegExp regex = RegExp(pattern.toString());
        if (!regex.hasMatch(value)) {
          return 'Vui lòng nhập tên công ty';
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
                        style: TextStyle(color: Colors.red, fontSize: 18),
                      )
                    ],
                  ),
                )
              : Container(),
          TextFormField(
            controller: widget.valueInput,
            maxLines: widget.lines ?? 1,
            obscureText:
                widget.isPassword ?? false ? _obscuraText : !_obscuraText,
            style:
                const TextStyle(fontSize: 16, overflow: TextOverflow.ellipsis),
            decoration: InputDecoration(
                errorText: widget.valueInput?.text.isNotEmpty ?? false
                    ? validate(widget.valueInput!.value.text)
                    : null,
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
