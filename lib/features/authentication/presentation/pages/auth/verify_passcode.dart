import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:osnv/core/route/routename.dart';
import '../../../../../core/const/text_style.dart';
import '../../../../../core/responsive/app_responsive.dart';
import '../../BloC/verify_code/verify_bloc.dart';
import '../../widgets/pin_input_screen.dart';
import '../../widgets/sign_custom_button.dart';

class VerifyPasscode extends StatefulWidget {
  final userid;

  VerifyPasscode(this.userid, {super.key});

  @override
  State<VerifyPasscode> createState() => _VerifyPasscodeState();
}

class _VerifyPasscodeState extends State<VerifyPasscode> {
  TextEditingController passcodeController = TextEditingController();

  Future<void> verified() async {
    final passcode = int.parse(passcodeController.text);
    final userId = widget.userid;
    context.read<VerifyBloc>().add(
      VerifyEvent(userId: userId, code: passcode),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: appW(40),
              vertical: appH(20),
            ),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back),
                    ),
                    Text("Verify passcode", style: upTextStyle),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Verify passcode number to make your account more secure.",
                      textAlign: TextAlign.center,
                      style: simpleText,
                    ),
                    Gap(appH(40)),
                PinInputScreen(passcodeController: passcodeController),
                  ],
                ),
                BlocConsumer<VerifyBloc, VerifyState>(
                  listener: (context, state) {
                    Navigator.pushNamed(context, RouteNames.SetFingerPrint);
                  },
                  builder: (context, state) {
                    if (state is VerifyLoading) {
                      return CircularProgressIndicator();
                    } else {
                      return SignCustomButton(
                        onPressed: () {
                          verified();
                        },
                        text: "Continue",
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
