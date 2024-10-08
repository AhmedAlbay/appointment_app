import 'package:appointment_app/core/di/dependency_injecton.dart';
import 'package:appointment_app/core/routing/routes.dart';
import 'package:appointment_app/features/home/logic/home_cubit.dart';
import 'package:appointment_app/features/home/ui/home_screen.dart';
import 'package:appointment_app/features/login/logic/cubit/login_cubit.dart';
import 'package:appointment_app/features/login/ui/login_screen.dart';
import 'package:appointment_app/features/onBoarding/onboarding_screen.dart';
import 'package:appointment_app/features/sign_up/logic/cubit/signup_cubit.dart';
import 'package:appointment_app/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));
      case Routes.signupScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignupCubit>(),
                  child: const SignUpScreen(),
                ));
      case Routes.homeScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => HomeCubit(getIt())..getSpecializations(),
                  child: const HomeScreen(),
                ));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text('Page Not Found'),
            ),
            body: const Center(
              child: Text('The page you are looking for does not exist.'),
            ),
          ),
        );
    }
  }
}
