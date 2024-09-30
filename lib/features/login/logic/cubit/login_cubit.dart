import 'package:appointment_app/features/login/data/model/login_request_body.dart';
import 'package:appointment_app/features/login/data/repos/login_repo.dart';
import 'package:appointment_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;
  LoginCubit(this.loginRepo) : super( const  LoginState.initial());
   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
   TextEditingController emailController =TextEditingController();

   TextEditingController passwordController =TextEditingController();

  void emitLoginState() async {
    emit(LoginState.loading());
    final response = await  loginRepo.login(LoginRequestBody(email: emailController.text, password: passwordController.text));


    response.when(success:
    (loginResponse){
emit( LoginState.success(loginResponse),);

    },
    
     failure: (error){

      emit(LoginState.error(error: error.apiErrorModel.message ??''));
     });


  }
}
