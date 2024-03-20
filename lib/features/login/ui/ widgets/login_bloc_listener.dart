import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutteradvnced/core/helpers/extensions.dart';
import 'package:flutteradvnced/core/routing/routes.dart';
import 'package:flutteradvnced/core/theming/styles.dart';
import 'package:flutteradvnced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutteradvnced/features/login/logic/cubit/login_state.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(loading: () {
          showDialog(
              context: context,
              builder: (context) => const Center(child: CircularProgressIndicator()));
        }, success: (loginResponse) {
          context.pop();
          context.pushNamed(Routes.homeScreen);
        }, error: (error) {
          context.pop();
          setupErrorState(context, error);
     
        });
        // TODO: implement listener
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
       showDialog(
        context: context,
        builder: (context) => AlertDialog(
              icon: const Icon(
                Icons.error,
                color: Colors.red,
                size: 32,
              ),
              content:
                  Text(error, style: TextStyles.font15DarkBlueMedium),
              actions: [
                TextButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'Got it',
                      style: TextStyles.font14BlueSemiBold,
                    ))
              ],
            ));
         
  }
}
