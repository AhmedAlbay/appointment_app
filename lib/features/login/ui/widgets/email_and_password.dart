import 'package:appointment_app/core/helpers/app_regex.dart';
import 'package:appointment_app/core/widgets/app_text_form_filed.dart';
import 'package:appointment_app/features/login/logic/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'pawword_validation.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  late TextEditingController passwordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool specialCharacters = false;
  bool hasMinLength = false;
  bool hasNumber = false;
  @override
  void initState() {
    super.initState();
    passwordController = context.read<LoginCubit>().passwordController;
    
   
      setupPasswordControllerListener();
  
  }

  void setupPasswordControllerListener() {
    passwordController.addListener(() {
      setState(() {
         hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
      hasMinLength = AppRegex.hasMinLength(passwordController.text);
      hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
      specialCharacters = AppRegex.hasSpecialCharacter(passwordController.text);
      hasNumber = AppRegex.hasNumber(passwordController.text);
      });
     
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormFiled(
            hintText: "Email",
            controller: context.read<LoginCubit>().emailController,
            vaildator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          AppTextFormFiled(
            controller: context.read<LoginCubit>().passwordController,
            vaildator: (value) {
              if (value == null ||
                  value.isEmpty 
                 ) {
                return 'Please enter a valid password';
              }
            },
            hintText: "Password",
            isObscureText: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          SizedBox(
            height: 24.h,
          ),
          PasswordValidation(
            hasLowerCase: hasLowerCase,
            hasMinLength: hasMinLength,
            specialCharacters: specialCharacters,
            hasNumber: hasNumber,
            hasUpperCase: hasUpperCase,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
