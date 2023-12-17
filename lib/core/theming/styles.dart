

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutteradvnced/core/theming/colors.dart';

class TextStyles{

  static TextStyle font24Black700Weight = TextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w700,
      color: Colors.black
  );

  static TextStyle font32BlueBold = TextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
      color: Colors.blue
  );

  static TextStyle font13GreyRegular =TextStyle(
    color: ColorsManager.greyColor,
    fontSize: 13.sp,
    fontWeight: FontWeight.normal
  );

  static TextStyle font16WhiteSemiBold =TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500
  );


}