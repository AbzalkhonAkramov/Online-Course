import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AuthVia extends StatelessWidget {
  const AuthVia({super.key, required this.onPressedFacebook, required this.onPressedGoogle, required this.onPressedApple});
  final VoidCallback onPressedFacebook ;
  final VoidCallback onPressedGoogle ;
  final VoidCallback onPressedApple ;

  @override
  Widget build(BuildContext context) {
    return Row(
      // crossAxisAlignment: CrossAxisAlignment.baseline,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(child: ElevatedButton(onPressed: onPressedFacebook, child: Icon(Icons.facebook))),
        Gap(20),
        Expanded(child: ElevatedButton(onPressed: onPressedGoogle, child: Icon(Icons.g_mobiledata))),
        Gap(20),
        Expanded(child: ElevatedButton(onPressed: onPressedApple, child: Icon(Icons.apple)))

      ],
    );
  }
}
