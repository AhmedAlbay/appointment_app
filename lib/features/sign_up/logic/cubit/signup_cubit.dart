import 'package:appointment_app/features/sign_up/data/model/signup_request_body.dart';
import 'package:appointment_app/features/sign_up/data/repo/signup_repo.dart';
import 'package:appointment_app/features/sign_up/logic/cubit/signup_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.signupRepo) : super(const SignupState.initial());
  final SignupRepo signupRepo;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Emit signup state when signup API call is initiated
  void emitSignupState() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    
    emit(const SignupState.loading());
    
    final response = await signupRepo.signup(
      SignupRequestBody(
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text,
        name: nameController.text,
        phone: phoneController.text,
        gender: 0,  // Change if gender comes from user input
      ),
    );

    // Handle success or failure response
    response.when(
      success: (signupResponse) {
        emit(SignupState.success(signupResponse));
      },
      failure: (error) {
        emit(SignupState.error(error: error.apiErrorModel.message ?? 'Unknown error occurred'));
      },
    );
  }
}
