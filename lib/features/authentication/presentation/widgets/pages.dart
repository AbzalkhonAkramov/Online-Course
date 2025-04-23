
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:osnv/core/const/icons_path.dart';
import 'package:osnv/core/const/text_style.dart';
import 'package:osnv/core/responsive/app_responsive.dart';

class Pages extends StatelessWidget {
  const Pages({super.key, required this.title, required this.picpath});
  final String title;
  final String picpath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: appW(34)),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SvgPicture.asset(IconsPath.InitialBg),
              Image.asset(picpath,height: appH(400),width: appW(363),fit: BoxFit.fill, ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: appW(34)),
          child: Text(title, style: customStyle, textAlign: TextAlign.center,),
        )
      ],
    );
  }
}

