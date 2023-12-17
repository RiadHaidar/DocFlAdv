

import 'package:flutter/material.dart';
import 'package:flutteradvnced/core/routing/routes.dart';
import 'package:flutteradvnced/features/login/ui/%20widgets/login_screen.dart';
import 'package:flutteradvnced/features/onboarding/onboarding_screen.dart';

class AppRouter{
  Route generateRoute(RouteSettings settings){

    //this arguments to be passed in any screen like this ()
    final arguments = settings.arguments;

    switch(settings.name){
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_)=> const OnBoardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_)=> const LoginScreen()  );

      default:
        return MaterialPageRoute(builder: (_)=>Scaffold(
          body: Center(child:
            Text('No route defined for ${settings.name}'),),
        ));

    }

  }
}