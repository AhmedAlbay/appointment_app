import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:appointment_app/core/routing/routes.dart';
import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';  // Import this for TapGestureRecognizer

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account? ",
            style: TextStyles.font12DarkBlueRegular,
          ),
          TextSpan(
            text: 'Signup',
            style: TextStyles.font12MainBlueRegular,
            recognizer: TapGestureRecognizer()..onTap = () {
             context.pushNamed(Routes.signupScreen) ; // Change this to your route to signup screen
            },
          ),
        ],
      ),
    );
  }
}
