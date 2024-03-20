import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteradvnced/core/helpers/spacing.dart';
import 'package:flutteradvnced/core/theming/colors.dart';
import 'package:flutteradvnced/core/theming/styles.dart';
import 'package:flutteradvnced/core/widgets/app_text_button.dart';
import 'package:flutteradvnced/core/widgets/app_text_from_field.dart';
import 'package:flutteradvnced/features/login/ui/%20widgets/already_have_account_text.dart';
import 'package:flutteradvnced/features/login/ui/%20widgets/terms_and_conditions_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool isObscureText = true;

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
                style: TextStyles.font14LightGrayRegular,
              ),
              verticalSpace(36),

              Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFromField(
                        hintText: 'Email',
                      ),
                      verticalSpace(18),
                      AppTextFromField(
                        hintText: 'Password',
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(
                                color: ColorsManager.mainBlue,
                                isObscureText
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                      ),
                      verticalSpace(24),
                      Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Text('Forgot Password?',
                          style: TextStyles.font13BlueRegular,)),
                      verticalSpace(40),
                      AppTextButton(buttonText: 'Login',textStyle: TextStyles.font16WhiteSemiBold,
                      onPressed: (){},),
                      verticalSpace(16),
                      AlreadyHaveAccountText(),
                      verticalSpace(60),
                      TermsAndConditionsText()


                    ],
                  ))
            ],
          ),
        ),
      ),
    ));
  }
}
