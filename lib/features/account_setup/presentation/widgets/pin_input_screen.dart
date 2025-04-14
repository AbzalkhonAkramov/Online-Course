import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinInputScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  PinCodeTextField(
      appContext: context,
      length: 4,
      obscureText: true,
      obscuringCharacter: '●',
      animationType: AnimationType.slide,
      keyboardType: TextInputType.number,
      textStyle: TextStyle(fontSize: 24),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        fieldHeight: 60,
        fieldWidth: 60,
        activeFillColor: Colors.white,
        inactiveFillColor: Colors.white,
        selectedFillColor: Color(0xFFF5F7FF),
        activeColor: Colors.transparent,
        inactiveColor: Colors.transparent,
        selectedColor: Colors.blue,
        borderWidth: 1,
      ),
      enableActiveFill: true,
      onChanged: (value) {
        print(value);
      },
    );
  }
}
