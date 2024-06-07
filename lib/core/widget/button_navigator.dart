import 'package:chamcong/core/theme/text_style.dart';
import 'package:flutter/material.dart';

class ButtonNavigator extends StatefulWidget {
  final String question; //câu hỏi ở tiêu đề
  final String pushNamed; // đi đâu
  final String titleArguments; // tiêu để của arguments
  final bool boolArguments; //value của arguments
  final String where; //đi đâu ở tiêu đề

  const ButtonNavigator(
      {super.key,
      required this.question,
      required this.pushNamed,
      required this.titleArguments,
      required this.boolArguments,
      required this.where});

  @override
  State<ButtonNavigator> createState() => _ButtonNavigatorState();
}

class _ButtonNavigatorState extends State<ButtonNavigator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.question, style: TextStyles.text16w4black),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, widget.pushNamed,
                  arguments: {widget.titleArguments: widget.boolArguments});
            },
            child: Text(widget.where, style: TextStyles.text18w7Primary))
      ],
    );
  }
}
