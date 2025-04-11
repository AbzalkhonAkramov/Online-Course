import 'package:flutter/material.dart';
double appH(double number) => Responsive.hight(number);

double appW(double number) => Responsive.width(number);

class Responsive {
  static late double screenHeight;
  static late double screenWidth;

  static void init(BuildContext context) {
    final size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
  }

  static double hight(double pixel) => (screenHeight/926) * pixel;

  static double width(double pixel) => (screenWidth/428) * pixel;
}
