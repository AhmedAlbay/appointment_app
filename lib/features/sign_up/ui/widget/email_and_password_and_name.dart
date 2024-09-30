import 'package:appointment_app/core/helpers/app_regex.dart';
import 'package:appointment_app/core/widgets/app_text_form_filed.dart';
import 'package:appointment_app/features/login/ui/widgets/pawword_validation.dart';
import 'package:appointment_app/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmailAndPasswordAndName extends StatefulWidget {
  const EmailAndPasswordAndName({super.key});

  @override
  State<EmailAndPasswordAndName> createState() => _EmailAndPasswordAndNameState();
}

class _EmailAndPasswordAndNameState extends State<EmailAndPasswordAndName> {
  bool isObscureText = true;
    bool isObscureConfirmText = true;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool specialCharacters = false;
  bool hasMinLength = false;
  bool hasNumber = false;

  @override
  void initState() {
    super.initState();
    final signupCubit = context.read<SignupCubit>();
    passwordController = signupCubit.passwordController;
    confirmPasswordController = signupCubit.confirmPasswordController;

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
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextFormFiled(
            hintText: "Name",
            keyboardType: TextInputType.name,
            controller: context.read<SignupCubit>().nameController,
            vaildator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
              return null; // Return null if valid
            },
          ),
          SizedBox(height: 16.h),
          AppTextFormFiled(
            hintText: "Email",
            controller: context.read<SignupCubit>().emailController,
            vaildator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null; // Return null if valid
            },
          ),
          SizedBox(height: 16.h),
          AppTextFormFiled(
            hintText: "Phone",
            keyboardType: TextInputType.phone,
            controller: context.read<SignupCubit>().phoneController,
            vaildator: (value) {
              if (value == null || value.isEmpty || !AppRegex.isPhoneNumberValid(value)) {
                return 'Please enter a valid phone number';
              }
              return null; // Return null if valid
            },
          ),
          SizedBox(height: 16.h),
          AppTextFormFiled(
            controller: context.read<SignupCubit>().passwordController,
            vaildator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null; // Return null if valid
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
          SizedBox(height: 24.h),
          AppTextFormFiled(
            controller: context.read<SignupCubit>().confirmPasswordController,
            vaildator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid confirmation password';
              } 
              return null; // Return null if valid
            },
            hintText: "Confirm Password",
            isObscureText: isObscureConfirmText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureConfirmText = !isObscureConfirmText;
                });
              },
              child: Icon(
                isObscureConfirmText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          SizedBox(height: 24.h),
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
    confirmPasswordController.dispose();
    super.dispose();
  }
}
