import 'package:abosultan/core/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../helper/font_weight_helper.dart';

abstract class TextStyles {
  static const String cairoFontFamily = 'Cairo';
  static const String hacenFontFamily = 'Hacen';

  static TextStyle font12greySemiBold = TextStyle(
    fontSize: 12.sp,
    fontFamily: hacenFontFamily,
    color: Colors.grey.shade700,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font12WhiteSemiBold = TextStyle(
    fontSize: 12.sp,
    fontFamily: hacenFontFamily,
    color: Colors.white,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font12goldSemiBold = TextStyle(
    fontSize: 12.sp,
    fontFamily: hacenFontFamily,
    color: AppColors.mainColor,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font14greySemiBold = TextStyle(
    fontSize: 14.sp,
    fontFamily: hacenFontFamily,
    color: Colors.grey.shade700,
    fontWeight: FontWeightHelper.semiBold,
  );
}
