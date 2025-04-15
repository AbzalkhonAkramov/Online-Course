import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:osnv/core/responsive/app_responsive.dart';
import 'package:osnv/features/auth/register/presentation/widgets/custom_button.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class ForgotPasswordPin extends StatelessWidget {
  const ForgotPasswordPin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: appW(24),vertical: appH(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Container(
              child: Column(
                children: [
                  Text("Code has been send to +1 111 ******99"),
                  Gap(20),
                  PinCodeTextField(
                    appContext: context,
                    length: 4,
                    obscuringCharacter: '●',
                    obscureText: true,
                    animationType: AnimationType.slide,
                    keyboardType: TextInputType.number,
                    textStyle: TextStyle(fontSize: 24),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(10),
                      fieldHeight: 60,
                      fieldWidth: 60,
                      activeFillColor: Colors.red,
                      inactiveFillColor: Colors.red,
                      selectedFillColor: Color(0xFFF5F7FF),
                      activeColor: Colors.green,
                      inactiveColor: Colors.transparent,
                      selectedColor: Colors.blue,
                      borderWidth: 1,
                    ),
                  ),
                  Gap(20),
                  Text("Resend code in 55 s"),
                ],
              ),
            ),
            SignCustomButton(onPressed: (){}, text: "Continue")
          ],
        ),
      ),
    );
  }
}
