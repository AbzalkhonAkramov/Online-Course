import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:osnv/core/route/routename.dart';
import 'package:osnv/features/account_setup/presentation/widgets/pin_input_screen.dart';
import 'package:osnv/features/auth/register/presentation/widgets/custom_button.dart';
import '../../../../core/const/text_style.dart';
import '../../../../core/responsive/app_responsive.dart';

class CreatePin extends StatelessWidget {
  const CreatePin({super.key});

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
                  Text("Create New PIN", style: upTextStyle),
                ],
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      "Add a PIN number to make your account more secure.",
                      textAlign: TextAlign.center,
                      style: simpleText,
                    ),
                    Gap(appH(40)),
                    PinInputScreen(),
                  ],
                ),
              ),
              SignCustomButton(onPressed: () {
                Navigator.pushNamed(context, RouteNames.SetFingerPrint);
              }, text: "Continue"),
            ],
          ),
        ),
      ),
    );
  }
}
