import 'package:flutter/material.dart';
import 'package:flutteradvnced/core/di/dependency_injection.dart';
import 'package:flutteradvnced/core/routing/routes.dart';
import 'package:flutteradvnced/features/home/ui/home_screen.dart';
import 'package:flutteradvnced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutteradvnced/features/login/login_screen.dart';
import 'package:flutteradvnced/features/onboarding/onboarding_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class AppRouter {
  Route generateRoute(RouteSettings settings) {
    //this arguments to be passed in any screen like this ()
    final arguments = settings.arguments;

    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());

      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                )
                );
    case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
