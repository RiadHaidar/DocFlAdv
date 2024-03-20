import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutteradvnced/core/helpers/app_regex.dart';
import 'package:flutteradvnced/core/helpers/spacing.dart';
import 'package:flutteradvnced/core/theming/colors.dart';
import 'package:flutteradvnced/core/widgets/app_text_from_field.dart';
import 'package:flutteradvnced/features/login/logic/cubit/login_cubit.dart';
import 'package:flutteradvnced/features/login/ui/%20widgets/password_validations.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacter = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    passwordController = context.read<LoginCubit>().passwordController;

    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacter =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasSpecialCharacter(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            AppTextFromField(
              hintText: 'Email',
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
              },
              controller: context.read<LoginCubit>().emailController,
            ),
            verticalSpace(18),
            AppTextFromField(
              hintText: 'Password',
              isObscureText: isObscureText,
              controller: context.read<LoginCubit>().passwordController,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
                child: Icon(
                  color: ColorsManager.mainBlue,
                  isObscureText ? Icons.visibility_off : Icons.visibility,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid password';
                }
              },
            ),
            verticalSpace(24),
            PasswordValidations(
              hasLowerCase: hasLowerCase,
              hasUpperCase: hasUpperCase,
              hasSpecialCharacter: hasSpecialCharacter,
              hasNumber: hasNumber,
              hasMinLength: hasMinLength,
            )
          ],
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    passwordController.dispose();
    super.dispose();

  }
}
