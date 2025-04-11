import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            indent: 10,
            endIndent: 10,
            thickness: 1.0,
            height: 5.0,
            color: Colors.black12,
          ),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Divider(
            indent: 10,
            endIndent: 10,
            thickness: 1.0,
            height: 5.0,
            color: Colors.black12,
          ),
        ),
      ],
    );
  }
}
