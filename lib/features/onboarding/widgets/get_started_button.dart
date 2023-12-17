

import 'package:flutter/material.dart';
import 'package:flutteradvnced/core/helpers/extensions.dart';
import 'package:flutteradvnced/core/routing/routes.dart';
import 'package:flutteradvnced/core/theming/colors.dart';
import 'package:flutteradvnced/core/theming/styles.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: () {
      context.pushNamed(Routes.loginScreen);

    },


        style: ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          backgroundColor: MaterialStateProperty.all(ColorsManager.mainBlue),
          minimumSize: MaterialStateProperty.all(
            const Size(double.infinity,52)
          ),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)
          ))
        ),
        child: Text('Get Started', style: TextStyles.font16WhiteSemiBold,));
  }
}
