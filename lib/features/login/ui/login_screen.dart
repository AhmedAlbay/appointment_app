import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:appointment_app/core/widgets/app_generate_button.dart';
import 'package:appointment_app/core/widgets/app_text_form_filed.dart';
import 'package:appointment_app/features/login/ui/widgets/agree_terms_text.dart';
import 'package:appointment_app/features/login/ui/widgets/already_have_account_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Corrected form key
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isObscureText = true;
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
                  height: 20.h,
                ),
                // Added form with key
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      const AppTextFormFiled(hintText: "Email"),
                      SizedBox(
                        height: 16.h,
                      ),
                      AppTextFormFiled(
                        hintText: "Password",
                        isObscureText: isObscureText,
                        suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                isObscureText = !isObscureText;
                              });
                            },
                            child: Icon(
                              isObscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            )),
                      ),
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
                        onPressed: () {},
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
