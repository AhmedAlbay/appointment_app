import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:appointment_app/core/widgets/app_generate_button.dart';
import 'package:appointment_app/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:appointment_app/features/sign_up/ui/widget/already_have_account_text.dart';
import 'package:appointment_app/features/sign_up/ui/widget/email_and_password_and_name.dart';
import 'package:appointment_app/features/sign_up/ui/widget/signup_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
                  "Create Account",
                  style: TextStyles.font24BlueBold,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!",
                  style: TextStyles.font14greyRegular,
                ),
                SizedBox(
                  height: 36.h,
                ),
                // Added form with key
                Column(
                  children: [
                    EmailAndPasswordAndName(),
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
                      buttonText: "Create Account",
                      onPressed: () {
                        vaildateThenDoSignup(context);
                      },
                      buttonTextStyle: TextStyles.font16WhiteSemiBold,
                    ),
                    SizedBox(
                      height: 40.h,
                    ),

                    const AlreadyHaveAccountText(),
                     const SignupBlocListener(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void vaildateThenDoSignup(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      return context.read<SignupCubit>().emitSignupState();
    }
  }
}
