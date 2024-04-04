import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutteradvnced/core/helpers/extensions.dart';
import 'package:flutteradvnced/core/routing/routes.dart';
import 'package:flutteradvnced/core/theming/styles.dart';
import 'package:flutteradvnced/features/signup/logic/signup_cubit.dart';
import 'package:flutteradvnced/features/signup/logic/signup_state.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: ((context, state) {
        state.whenOrNull(
          loading: () => showDialog(context: context, builder: (context)=>Center(child: CircularProgressIndicator())),
          success: (data) {
            context.pushNamed(Routes.signupScreen);
          },
          error: (error) {
            context.pop();
            setupErrorState(context, error);
          },
        );
      }),
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      child: const SizedBox.shrink(),
    );
  }
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
            content: Text(error, style: TextStyles.font15DarkBlueMedium),
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
