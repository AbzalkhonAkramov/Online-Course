import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osnv/core/const/icons_path.dart';
import 'package:osnv/core/const/text_style.dart';
import 'package:osnv/core/responsive/app_responsive.dart';
import 'package:osnv/core/route/routename.dart';
import 'package:osnv/features/auth/register/presentation/widgets/auth_button.dart';
import 'package:osnv/features/auth/register/presentation/widgets/custom_button.dart';
import 'package:osnv/features/auth/register/presentation/widgets/custom_divider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: appW(20)),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(IconsPath.SingUpIcon, height: appH(200)),
                Text('Let’s you in', style: customStyle),
                AuthButton(
                  text: "Continue with Facebook",
                  onPressed: () {},
                  picpath: IconsPath.FacebookIcon,
                ),
                AuthButton(
                  text: "Continue with Google",
                  onPressed: () {},
                  picpath: IconsPath.GoogleIcon,
                ),
                AuthButton(
                  text: "Continue with Apple",
                  onPressed: () {},
                  picpath: IconsPath.AppleIcon,
                ),
                CustomDivider(text: "or"),
                SignCustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteNames.CreateAccount);
                  },
                  text: "Sign in with password",
                ),

                RichText(
                  text: TextSpan(
                    text: "Don’t have an account?",
                    style: underContent,
                    children: <TextSpan>[
                      TextSpan(
                        text: "Sign Up",
                        style: underContentBlue,
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap =
                                  () => Navigator.pushNamed(
                                    context,
                                    RouteNames.SplashPage,
                                  ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
