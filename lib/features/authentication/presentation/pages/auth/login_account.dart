import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:osnv/core/const/colors.dart';
import 'package:osnv/core/const/text_style.dart';
import 'package:osnv/core/responsive/app_responsive.dart';
import '../../../../../core/route/routename.dart';
import '../../widgets/auth_via.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/sign_custom_button.dart';

class LoginAccount extends StatefulWidget {
  const LoginAccount({super.key});

  @override
  State<LoginAccount> createState() => _LoginAccountState();
}

class _LoginAccountState extends State<LoginAccount> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  bool isChecked = false;

  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.selected,
    };
    if (states.any(interactiveStates.contains)) {
      return AppColors.pagenation;
    }
    return Colors.transparent;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: appH(886),
            width: appW(428),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: appW(40),
                vertical: appH(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back),
                  ),
                  Text("Login to your\nAccount", style: customStyle),
                  Gap(appH(30)),
                  CustomTextfield(
                    controller: emailcontroller,
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email),
                  ),
                  CustomTextfield(
                    controller: passwordcontroller,
                    hintText: "Password",
                    obscureText: true,
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.remove_red_eye),
                  ),
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        fillColor: WidgetStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                            // print(isChecked);
                          });
                        },
                      ),
                      Text("Remember me", style: buttonStyleblack),
                    ],
                  ),
                  SignCustomButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        RouteNames.FillProfile,
                        (Route<dynamic> route) => false,
                      );
                    },
                    text: "Sign Up",
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.CreateAccount);
                      },
                      child: Text(
                        "Forgot the password?",
                        style: TextStyle(color: AppColors.pagenation),
                      ),
                    ),
                  ),
                  CustomDivider(text: "or continue with"),
                  AuthVia(
                    onPressedFacebook: () {},
                    onPressedGoogle: () {},
                    onPressedApple: () {},
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        text: "Don't have an account?  ",
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
                                        RouteNames.FillProfile,
                                      ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
