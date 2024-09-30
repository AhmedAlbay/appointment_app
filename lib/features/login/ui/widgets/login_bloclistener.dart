import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:appointment_app/core/routing/routes.dart';
import 'package:appointment_app/core/theming/color.dart';
import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:appointment_app/features/login/logic/cubit/login_cubit.dart';
import 'package:appointment_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
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
            context.pop();
            context.pushNamed(
              Routes.homeScreen,
            );
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
        context.pop();
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
        actions: [TextButton(onPressed: (){
          context.pop();
    
        }, child: Text("Got It" ,style: TextStyles.font14kBlueSemiBold,))],
      ),
    );
  }
}
