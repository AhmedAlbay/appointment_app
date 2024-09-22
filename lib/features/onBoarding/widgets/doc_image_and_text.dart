import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/text_styles.dart';

class DocImageAndText extends StatelessWidget {
  const DocImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset("assets/svgs/doc_log_with_opacity.svg"),
        Container(
          foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: const [
                0.14,
                0.4
              ],
                  colors: [
                Colors.white,
                Colors.white.withOpacity(0.0),
              ])),
          child: Image.asset("assets/images/doc_onboarding.png"),
        ),
        Positioned(
          bottom: 30,
          child: Text(
            
            "Best Doctor\nAppointment App",
            textAlign: TextAlign.center,
            style: TextStyles.font32BoldBlue.copyWith(
              
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
