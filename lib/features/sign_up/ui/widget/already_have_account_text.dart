import 'package:appointment_app/core/helpers/extensions.dart';
import 'package:appointment_app/core/routing/routes.dart';
import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';  // Import this for TapGestureRecognizer

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account yet? ',
            style: TextStyles.font12DarkBlueRegular,
          ),
          TextSpan(
            text: 'Login',
            style: TextStyles.font12MainBlueRegular,
            recognizer: TapGestureRecognizer()..onTap = () {
              context.pushNamed(Routes.loginScreen);  // Change this to your login route
            },
          ),
        ],
      ),
    );
  }
}
