import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/const/text_style.dart';
import '../../../../core/responsive/app_responsive.dart';

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
              SvgPicture.asset(""),
              Text(
                "Please put your finger on the fingerprint scanner to get started.",                textAlign: TextAlign.center,
                style: simpleText,
              ),

              Row(children: [
                // SignCustomButton(onPressed: () { }, text: 'Next',),
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
