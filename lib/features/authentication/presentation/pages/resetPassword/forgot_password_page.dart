import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osnv/core/const/colors.dart';
import 'package:osnv/core/const/icons_path.dart';
import 'package:osnv/core/responsive/app_responsive.dart';
import 'package:osnv/core/route/routename.dart';

import '../../widgets/sign_custom_button.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool isSelected = false;

  void selectMethod(bool selected) {
    setState(() {
      isSelected = selected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset(IconsPath.ForgotPasswordPic),
            Text(
              "Select which contact details should we use to reset your password",
            ),
            GestureDetector(
              onTap: () => selectMethod(false),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: appH(20),
                  horizontal: appW(20),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        isSelected ? AppColors.textGrey : AppColors.pagenation,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(IconsPath.ForgotSmsIcon),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: appW(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text("via SMS:"), Text("+1 111 ******99")],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => selectMethod(true),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: appH(20),
                  horizontal: appW(20),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color:
                        isSelected ? AppColors.pagenation : AppColors.textGrey,
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(IconsPath.ForgotMessageIcon),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: appW(20)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("via Email:"),
                          Text("and***ley@yourdomain.com"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SignCustomButton(
              onPressed: () {
                Navigator.pushNamed(context, RouteNames.ForgotPasswordPin);
              },
              text: "Continue",
            ),
          ],
        ),
      ),
    );
  }
}
