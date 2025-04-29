import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:osnv/core/const/colors.dart';
import 'package:osnv/core/const/text_style.dart';
import 'package:osnv/core/responsive/app_responsive.dart';

import '../../../../../core/route/routename.dart';
import '../../BloC/auth/auth_bloc.dart';
import '../../widgets/auth_via.dart';
import '../../widgets/custom_divider.dart';
import '../../widgets/custom_textfield.dart';
import '../../widgets/sign_custom_button.dart';

class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
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

  Future<void> ongetPressed() async {
    final email = emailcontroller.text;
    final password = passwordcontroller.text;
    context.read<AuthBloc>().add(AuthEvent(password: password, email: email));
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
                  Text("Create your\nAccount", style: customStyle),
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
                          });
                        },
                      ),
                      Text("Remember me", style: buttonStyleblack),
                    ],
                  ),
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthSuccess) {
                        Navigator.pushNamed(
                          context,
                          RouteNames.VerifyPasscode,
                          arguments: state.getUser.userId
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return CircularProgressIndicator();
                      }
                        return SignCustomButton(
                        onPressed: () {
                          ongetPressed();
                        },
                        text: "Sign Up",
                      );
                    },
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
                        text: "Already have an account?  ",
                        style: underContent,
                        children: <TextSpan>[
                          TextSpan(
                            text: "Sign In",
                            style: underContentBlue,
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap =
                                      () => Navigator.pushNamed(
                                        context,
                                        RouteNames.LoginAccount,
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
