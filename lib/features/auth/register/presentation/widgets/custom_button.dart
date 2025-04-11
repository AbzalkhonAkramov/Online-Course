import 'package:flutter/material.dart';
import 'package:osnv/core/const/colors.dart';
import 'package:osnv/core/const/text_style.dart';
import 'package:osnv/core/responsive/app_responsive.dart';

class SignCustomButton extends StatelessWidget {
  const SignCustomButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            child: Text(text, style: buttonStyle),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.pagenation,
              padding: EdgeInsets.symmetric(vertical: appH(15))
            ),
          ),
        ),
      ],
    );
  }
}
