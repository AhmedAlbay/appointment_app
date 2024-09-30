import 'package:appointment_app/core/routing/app_router.dart';
import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:appointment_app/core/widgets/app_generate_button.dart';
import 'package:appointment_app/features/login/data/model/login_request_body.dart';
import 'package:appointment_app/features/login/logic/cubit/login_cubit.dart';
import 'package:appointment_app/features/login/ui/widgets/agree_terms_text.dart';
import 'package:appointment_app/features/login/ui/widgets/already_have_account_text.dart';
import 'package:appointment_app/features/login/ui/widgets/email_and_password.dart';
import 'package:appointment_app/features/login/ui/widgets/login_bloclistener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // Corrected form key
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyles.font24BlueBold,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                  style: TextStyles.font14greyRegular,
                ),
                SizedBox(
                  height: 36.h,
                ),
                // Added form with key
                Column(
                  children: [
                    EmailAndPassword(),
                    SizedBox(
                      height: 16.h,
                    ),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Text(
                        "Forgot Password?",
                        style: TextStyles.font12MainBlueRegular,
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    AppGenerateButton(
                      buttonText: "Login",
                      onPressed: () {
                        vaildateThenDoLogin(context);
                      },
                      buttonTextStyle: TextStyles.font16WhiteSemiBold,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    const AgreeTermsText(),
                    SizedBox(
                      height: 24.h,
                    ),
                    const AlreadyHaveAccountText(),
                    const LoginBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void vaildateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      return context.read<LoginCubit>().emitLoginState(
            LoginRequestBody(
              email: context.read<LoginCubit>().emailController.text,
              password: context.read<LoginCubit>().passwordController.text,
            ),
          );
    }
  }
}
