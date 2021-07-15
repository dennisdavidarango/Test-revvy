import 'package:flutter/material.dart';

import 'screens/sign_up/create_account_name_screen.dart';
import 'screens/sign_up/date_of_birthday_screen.dart';
import 'screens/sign_up/home_screen.dart';
import 'screens/sign_up/password_screen.dart';
import 'screens/sign_up/profile_picture_screen.dart';
import 'screens/sign_up/sign_up_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {

// #region sign_up
      case HomeScreen.Route:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case SignUpScreen.Route:
        return MaterialPageRoute(builder: (_) => SignUpScreen());

      case PasswordScreen.Route:
        return MaterialPageRoute(builder: (_) => PasswordScreen());

      case CreateAccountNameScreen.Route:
        return MaterialPageRoute(builder: (_) => CreateAccountNameScreen());

      case ProfilePictureScreen.Route:
        return MaterialPageRoute(builder: (_) => ProfilePictureScreen());

      case DateOfBirthdayScreen.Route:
        return MaterialPageRoute(builder: (_) => DateOfBirthdayScreen());

// #endregion

      //TODO: fix this default route
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
