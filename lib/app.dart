import 'package:flutter/material.dart';
import 'package:osnv/core/responsive/app_responsive.dart';
import 'package:osnv/core/route/route_generator.dart';

import 'core/route/routename.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    // print(Responsive.screenWidth);
    // print(Responsive.screenHeight);
    return MaterialApp(
      initialRoute: RouteNames.SetFingerPrint,
      onGenerateRoute: AppRoute(context: context).onGenerateRoute,
    );
  }
}
