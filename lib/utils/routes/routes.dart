import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_api/utils/routes/routes_name.dart';
import 'package:get_api/view/home_screen.dart';
import 'package:get_api/view/login_view.dart';
import 'package:get_api/view/signup_view.dart';
import 'package:get_api/view/splash_view.dart';

class Routes{
  static Route<dynamic>  generateRoute(RouteSettings settings){
    final argame = settings.arguments;
    switch(settings.name){
      case RouteName.splash:
        return MaterialPageRoute(builder: (BuildContext context) => const SplashView());
      case RouteName.home:
        return MaterialPageRoute(builder: (BuildContext context) => const HomeScreen());
      case RouteName.login:
        return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
        case RouteName.signUp:
        return MaterialPageRoute(builder: (BuildContext context) => const SignupView ());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text("No route defined"),
            ),
          );
        });
    }
  }
}