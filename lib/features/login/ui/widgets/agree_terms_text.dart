import 'package:appointment_app/core/theming/text_styles.dart';
import 'package:flutter/material.dart';

class AgreeTermsText extends StatelessWidget {
  const AgreeTermsText({super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'By logging, you agree to our ',
            style: TextStyles.font12greyRegular
          ),
           TextSpan(
            text: 'Terms & Conditions ',
            style: TextStyles.font12DarkBlueRegular
          ),
           TextSpan(
            text: 'and ',
            style: TextStyles.font12greyRegular.copyWith(height: 1.4)
          ),
          TextSpan(
            text: 'PrivacyPolicy.',
            style: TextStyles.font12DarkBlueRegular
          ),
        ],
      ),
    );
  }
}