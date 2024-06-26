import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteradvnced/core/helpers/extensions.dart';
import 'package:flutteradvnced/core/helpers/spacing.dart';
import 'package:flutteradvnced/core/routing/routes.dart';
import 'package:flutteradvnced/core/theming/colors.dart';
import 'package:flutteradvnced/core/theming/styles.dart';
import 'package:flutteradvnced/core/widgets/app_text_button.dart';
import 'package:flutteradvnced/core/widgets/app_text_from_field.dart';
import 'package:flutteradvnced/features/login/data/models/login_request_body.dart';
import 'package:flutteradvnced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutteradvnced/features/login/ui/%20widgets/dont_have_account_text.dart';
import 'package:flutteradvnced/features/login/ui/%20widgets/email_and_password.dart';
import 'package:flutteradvnced/features/login/ui/%20widgets/login_bloc_listener.dart';
import 'package:flutteradvnced/features/login/ui/%20widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                'Welcome Back',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8),
              //    SizedBox(height: 8.h,),
              Text(
                'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                style: TextStyles.font13GrayRegular,
              ),
              verticalSpace(36),

              Column(
                children: [
                  const EmailAndPassword(),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13BlueRegular,
                      )),
                  verticalSpace(40),
                  AppTextButton(
                    buttonText: 'Login',
                    textStyle: TextStyles.font16WhiteSemiBold,
                    onPressed: () {
                      validateThenDoLogin(context);
                    },
                  ),
                  verticalSpace(16),
                  GestureDetector(child: const DontHaveAccountText(), 
                  onTap: (){
                    context.pushNamed(Routes.signupScreen);
                  },),
                  verticalSpace(60),
                  const TermsAndConditionsText(),
                  const LoginBlocListener()
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}

void validateThenDoLogin(BuildContext context) {
  if (context.read<LoginCubit>().formKey.currentState!.validate()) {
    context.read<LoginCubit>().emitLoginStates(
        );
  }
}
