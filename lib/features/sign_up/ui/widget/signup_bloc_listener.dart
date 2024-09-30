import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:appointment_app/core/routing/routes.dart';
import 'package:appointment_app/core/theming/color.dart';
import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:appointment_app/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:appointment_app/features/sign_up/logic/cubit/signup_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupBlocListener extends StatelessWidget {
  const SignupBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignupCubit, SignupState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorManager.mainColor,
                ),
              ),
            );
          },
          success: (value) {
            setupSuccessState(context);
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop(); // Close the loading dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.error,
          color: Colors.red,
          size: 32.sp,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMeduim,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop(); // Close the error dialog
            },
            child: Text(
              "Got It",
              style: TextStyles.font14kBlueSemiBold,
            ),
          )
        ],
      ),
    );
  }

  void setupSuccessState(BuildContext context) {
    context.pop(); // Close the loading dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: Icon(
          Icons.check_circle,
          color: Colors.green,
          size: 32.sp,
        ),
        content: Text(
          "Signup successful! Please login.",
          style: TextStyles.font15DarkBlueMeduim,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop(); // Close the success dialog
              context.pushNamed(Routes.loginScreen);
            },
            child: Text(
              "Got It",
              style: TextStyles.font14kBlueSemiBold,
            ),
          )
        ],
      ),
    );
  }
}
