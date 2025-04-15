import 'package:flutter/material.dart';
import '../../const/text_style.dart';

class BackAppbar extends StatelessWidget {
  BackAppbar({super.key, required this.text, this.icon, this.onTab});

  final IconData? icon;
  final String text;
  final VoidCallback? onTab;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
      title: Text(text, style: customStyle),
      actions: [GestureDetector(onTap: onTab, child: Icon(icon))],
    );
  }
}
