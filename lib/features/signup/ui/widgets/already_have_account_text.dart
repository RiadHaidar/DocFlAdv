

      import 'package:flutter/cupertino.dart';
import 'package:flutteradvnced/core/theming/styles.dart';

class AlreadyHaveAccountText extends StatelessWidget {
        const AlreadyHaveAccountText({super.key});

        @override
        Widget build(BuildContext context) {
          return RichText(
            textAlign: TextAlign.center,

              text: TextSpan(children: [
                TextSpan(
                    text: 'already have an account?',
                style: TextStyles.font13DarkBlueRegular),

                TextSpan(
                  text: ' Sign in',
                  style: TextStyles.font13BlueSemiBold
                )

              ]));
        }
      }
