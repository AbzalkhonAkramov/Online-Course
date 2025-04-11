import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:osnv/core/const/text_style.dart';
import 'package:osnv/core/responsive/app_responsive.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.picpath,
  });

  final String picpath;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(picpath, height: appH(30), width: appW(30)),
                Gap(10),
                Text(text, style: buttonStyleblack),
              ],
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: appH(16)),
            ),
          ),
        ),
      ],
    );
  }
}
