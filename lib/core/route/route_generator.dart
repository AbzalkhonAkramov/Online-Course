import 'package:flutter/material.dart';
import 'package:osnv/core/route/routename.dart';
import 'package:osnv/features/account_setup/presentation/pages/create_pin.dart';
import 'package:osnv/features/account_setup/presentation/pages/fill_profile.dart';
import 'package:osnv/features/account_setup/presentation/pages/set_fingerprint_page.dart';
import 'package:osnv/features/auth/register/presentation/page/create_account.dart';
import 'package:osnv/features/auth/register/presentation/page/login_account.dart';
import 'package:osnv/features/init/presentation/page/splash_page.dart';
import '../../features/init/presentation/page/initial_page.dart';
import "../../features/auth/register/presentation/page/signup.dart";

class AppRoute {
  BuildContext context;

  AppRoute({required this.context});

  Route onGenerateRoute(RouteSettings routesettings) {
    switch (routesettings.name) {
      case RouteNames.SplashPage:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RouteNames.InitialPage:
        return MaterialPageRoute(builder: (_) => InitialPage());
      case RouteNames.SingUp:
        return MaterialPageRoute(builder: (_) => SignUp());
      case RouteNames.CreateAccount:
        return MaterialPageRoute(builder: (_) => CreateAccount());
      case RouteNames.LoginAccount:
        return MaterialPageRoute(builder: (_) => LoginAccount());
      case RouteNames.FillProfile:
        return MaterialPageRoute(builder: (_) => FillProfile());
      case RouteNames.CreatePin:
        return MaterialPageRoute(builder: (_) => CreatePin());
      case RouteNames.SetFingerPrint:
        return MaterialPageRoute(builder: (_)=> SetFingerprintPage());
      default:
        return _errorRoute();
    }
  }

  Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder:
          (_) => Scaffold(
            appBar: AppBar(title: const Text('Error')),
            body: const Center(child: Text('Page not found')),
          ),
    );
  }
}
