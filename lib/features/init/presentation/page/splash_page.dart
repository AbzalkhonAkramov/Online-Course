import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osnv/core/const/colors.dart';
import 'package:osnv/core/const/icons_path.dart';
import 'package:osnv/core/responsive/app_responsive.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgwhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: appH(100)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  IconsPath.SplashIcon,
                  height: appH(140),
                  width: appW(140),
                ),
                SvgPicture.asset(
                  IconsPath.SplashLoad,
                  height: appH(60),
                  width: appW(60),
                ),
              ],

            ),
          ),
        ),
      ),
    );
  }
}
