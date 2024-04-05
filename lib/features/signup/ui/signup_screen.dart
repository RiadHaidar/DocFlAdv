import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteradvnced/core/helpers/spacing.dart';
import 'package:flutteradvnced/core/theming/styles.dart';
import 'package:flutteradvnced/core/widgets/app_text_button.dart';
import 'package:flutteradvnced/features/signup/data/models/signup_request_body.dart';
import 'package:flutteradvnced/features/signup/logic/signup_cubit.dart';
import 'package:flutteradvnced/features/signup/ui/widgets/already_have_account_text.dart';
import 'package:flutteradvnced/features/signup/ui/widgets/signup_form.dart';
import 'package:flutteradvnced/features/signup/ui/widgets/signup_bloc_listener.dart';
import 'package:flutteradvnced/features/signup/ui/widgets/terms_and_conditions_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font13GrayRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const SignUpForm(),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: 'Signup',
                      textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: () {
                        print('test');
                        validateThenDoLogin(context);
                        //    validateThenDoLogin(context);
                      },
                    ),
                         verticalSpace(16),
                    const TermsAndConditionsText(),
                    verticalSpace(30),
                    const AlreadyHaveAccountText(),
                    const SignUpBlocListener()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void validateThenDoLogin(BuildContext context) {
  if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
    context.read<SignUpCubit>().emitSingUpStates();
  }
}
