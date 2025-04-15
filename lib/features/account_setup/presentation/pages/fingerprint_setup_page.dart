import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osnv/core/const/icons_path.dart';

class FingerprintSetupPage extends StatelessWidget {
  const FingerprintSetupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SvgPicture.asset(IconsPath.CongratulationsIcon),
      content: Text("Your account ready to use. You will be redirected to the Home page in a few seconds"),
    );
  }
}
