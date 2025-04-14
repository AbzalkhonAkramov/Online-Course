import 'package:flutter/material.dart';
import 'package:osnv/core/const/colors.dart';
import 'package:osnv/core/const/text_style.dart';
import 'package:osnv/core/responsive/app_responsive.dart';

class InitialButtion extends StatelessWidget {
  const InitialButtion({super.key, required this.text, required this.onPressed});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: appW(20)),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.pagenation,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )
          ),
          child: Text(text, style: buttonStyle,),
        ),
      ),
    );
  }
}
