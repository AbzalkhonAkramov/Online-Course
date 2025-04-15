import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:osnv/core/const/icons_path.dart';
import 'package:osnv/core/responsive/app_responsive.dart';
import 'package:osnv/features/auth/register/presentation/widgets/custom_button.dart';
import 'package:osnv/features/auth/register/presentation/widgets/custom_textfield.dart';

import '../../../../core/const/colors.dart';
import '../../../../core/const/text_style.dart';

class CreateNewPassword extends StatefulWidget {
  CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController password2controller = TextEditingController();

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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: appW(20)),
            child: Container(
              height: appH(926),
              width: appW(428),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(IconsPath.CreateNewPasswordPic),
                  Container(
                    height: appH(241),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Create Your New Password",textAlign: TextAlign.start,),
                        Gap(30),
                        CustomTextfield(
                          controller: passwordcontroller,
                          hintText: "Password",
                        ),
                        Gap(20),
                        CustomTextfield(
                          controller: passwordcontroller,
                          hintText: "Repit Password",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(
                              fillColor: WidgetStateProperty.resolveWith(
                                getColor,
                              ),
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                  print(isChecked);
                                });
                              },
                            ),
                            Text("Remember me", style: buttonStyleblack),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SignCustomButton(onPressed: () {}, text: "Continue"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
