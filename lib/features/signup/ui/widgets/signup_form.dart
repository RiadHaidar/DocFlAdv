import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutteradvnced/core/helpers/app_regex.dart';
import 'package:flutteradvnced/core/helpers/spacing.dart';
import 'package:flutteradvnced/core/theming/colors.dart';
import 'package:flutteradvnced/core/widgets/app_text_from_field.dart';
import 'package:flutteradvnced/features/signup/logic/signup_cubit.dart';
import 'package:flutteradvnced/features/signup/ui/widgets/password_validations.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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

    passwordController = context.read<SignUpCubit>().passwordController;

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
        key: context.read<SignUpCubit>().formKey,
        child: Column(
          children: [
                  AppTextFromField(
              hintText: 'Name',
              validator: (value) {
                if (value == null ||
                    value.isEmpty) {
                  return 'Please enter your name';
                }
              },
              controller: context.read<SignUpCubit>().nameController,
            ),
            verticalSpace(18),
            AppTextFromField(
              hintText: 'Email',
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
              },
              controller: context.read<SignUpCubit>().emailController,
            ),
            verticalSpace(18),
                  AppTextFromField(
            hintText: 'Phone number',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
            },
            controller: context.read<SignUpCubit>().phoneController,
          ),
          verticalSpace(18),
            AppTextFromField(
              hintText: 'Password',
              isObscureText: isObscureText,
              controller: context.read<SignUpCubit>().passwordController,
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
     
       
            verticalSpace(18),
            AppTextFromField(
              hintText: 'Confirmation Password',
              isObscureText: isObscureText,
              controller: context.read<SignUpCubit>().confirmPasswordController,
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
                if(value!=context.read<SignUpCubit>().passwordController.text){
                  return 'Your password doesn\'t match';
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
