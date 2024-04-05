import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutteradvnced/features/signup/data/models/signup_request_body.dart';
import 'package:flutteradvnced/features/signup/data/repos/signup_repo.dart';
import 'package:flutteradvnced/features/signup/logic/signup_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;

  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();


    void emitSingUpStates()async{
      emit(const SignUpState.loading());
      final response= await _signUpRepo.signup(
        SignUpRequestBody
      (name: nameController.text, email: emailController.text, phone:
       phoneController.text, 
       gender:0, 
       password:
        passwordController.text, passwordConfirmation:
         confirmPasswordController.text));

      response.when(success: (singUpResponse){
        emit(SignUpState.success(singUpResponse));
      }, failure: (error){
              emit(SignUpState.error(error: error.failure.message??''));
      });
    }

}
