import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:osnv/core/route/routename.dart';
import '../../../../../core/const/text_style.dart';
import '../../../../../core/responsive/app_responsive.dart';
import '../../widgets/pin_input_screen.dart';
import '../../widgets/sign_custom_button.dart';

class CreatePin extends StatefulWidget {
  CreatePin({super.key});

  @override
  State<CreatePin> createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  TextEditingController passcodeController = TextEditingController();

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
              Column(
                children: [
                  Text(
                    "Add a PIN number to make your account more secure.",
                    textAlign: TextAlign.center,
                    style: simpleText,
                  ),
                  Gap(appH(40)),
                  PinInputScreen(passcodeController: passcodeController,),
                ],
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
