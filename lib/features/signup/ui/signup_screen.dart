import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteradvnced/core/helpers/spacing.dart';
import 'package:flutteradvnced/core/theming/styles.dart';
import 'package:flutteradvnced/core/widgets/app_text_button.dart';
import 'package:flutteradvnced/features/signup/ui/widgets/email_and_password.dart';

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
                          const  EmailAndPassword(),

              verticalSpace(36),
            Column(
                children: [
              //    const EmailAndPassword(),
                  Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        'Forgot Password?',
                        style: TextStyles.font13BlueRegular,
                      )),
                  verticalSpace(40),
                  AppTextButton(
                    buttonText: 'Signup',
                    textStyle: TextStyles.font16WhiteSemiBold,
                    onPressed: () {
                  //    validateThenDoLogin(context);
                    },
                  ),
                  // verticalSpace(16),
                  // GestureDetector(child: const AlreadyHaveAccountText(), 
                  // onTap: (){
                  //   context.pushNamed(Routes.loginScreen);
                  // },),
                  // verticalSpace(60),
                  // const TermsAndConditionsText(),
           //       const LoginBlocListener()
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
