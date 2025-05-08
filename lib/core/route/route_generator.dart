import 'package:flutter/material.dart';
import 'package:osnv/core/route/routename.dart';
import 'package:osnv/features/authentication/presentation/pages/account_setup/fill_profile.dart';
import 'package:osnv/features/authentication/presentation/pages/auth/create_account.dart';
import 'package:osnv/features/authentication/presentation/pages/auth/login_account.dart';
import 'package:osnv/features/authentication/presentation/pages/auth/signup.dart';
import 'package:osnv/features/authentication/presentation/pages/auth/verify_passcode.dart';

import '../../features/authentication/presentation/pages/account_setup/create_pin.dart';
import '../../features/authentication/presentation/pages/account_setup/fingerprint_setup_page.dart';
import '../../features/authentication/presentation/pages/account_setup/set_fingerprint_page.dart';
import '../../features/authentication/presentation/pages/init/initial_page.dart';
import '../../features/authentication/presentation/pages/init/splash_page.dart';
import '../../features/authentication/presentation/pages/resetPassword/create_new_password.dart';
import '../../features/authentication/presentation/pages/resetPassword/forgot_password_page.dart';
import '../../features/authentication/presentation/pages/resetPassword/forgot_password_pin.dart';
import '../../features/home/presentation/pages/course_details_page.dart';
import '../../features/home/presentation/pages/first_page.dart';
import '../../features/home/presentation/pages/seach_page.dart';
import '../../features/home/presentation/pages/top_mentors_page.dart';

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
        return MaterialPageRoute(builder: (_) => SetFingerprintPage());
      case RouteNames.FingerprintSetupPage:
        return MaterialPageRoute(builder: (_) => FingerprintSetupPage());
      case RouteNames.ForgotPasswordPage:
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case RouteNames.ForgotPasswordPin:
        return MaterialPageRoute(builder: (_) => ForgotPasswordPin());
      case RouteNames.CreateNewPassword:
        return MaterialPageRoute(builder: (_) => CreateNewPassword());
      case RouteNames.FirstPage:
        return MaterialPageRoute(builder: (_) => FirstPage());
      case RouteNames.CourseDetailPage:
        final id = routesettings.arguments;
        return MaterialPageRoute(builder: (_) => CourseDetailPage(id: id));
      case RouteNames.TopMentorsPage:
        return MaterialPageRoute(builder: (_) => TopMentorsPage());
      case RouteNames.SearchPage:
        return MaterialPageRoute(builder: (_) => SearchPage());
      case RouteNames.VerifyPasscode:
        final userid = routesettings.arguments;
        return MaterialPageRoute(builder: (_) => VerifyPasscode(userid));

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
