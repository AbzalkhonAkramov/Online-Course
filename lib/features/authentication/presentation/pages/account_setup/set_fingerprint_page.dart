import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:osnv/core/const/colors.dart';
import 'package:osnv/core/const/icons_path.dart';
import 'package:osnv/core/route/routename.dart';

import '../../../../../core/const/text_style.dart';
import '../../../../../core/responsive/app_responsive.dart';

class SetFingerprintPage extends StatelessWidget {
  const SetFingerprintPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: appW(40),
            vertical: appH(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                  ),
                  Text("Set Your Fingerprint", style: upTextStyle),
                ],
              ),
              Text(
                "Add a PIN number to make your account more secure.",
                textAlign: TextAlign.center,
                style: simpleText,
              ),
              SvgPicture.asset(IconsPath.FingerPrintIcon),
              Text(
                "Please put your finger on the fingerprint scanner to get started.",
                textAlign: TextAlign.center,
                style: simpleText,
              ),

              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {Navigator.pushNamed(context, RouteNames.FirstPage);},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffEBEFFE)
                      ),
                      child: Text(
                        "Skip",
                        style: TextStyle(color: AppColors.pagenation),
                      ),
                    ),
                  ),
                  Gap(20),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {Navigator.pushNamed(context, RouteNames.ForgotPasswordPage);},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.pagenation
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(color: Color(0xffEBEFFE)),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
