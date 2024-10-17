import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactic_zone/src/utils/app_color.dart';

class AppTextStyle {
  static TextStyle textStyle40 = GoogleFonts.acme(
    color: AppColor.withColor,
    fontSize: 40.sp,
  );
  static TextStyle textStyle30 = GoogleFonts.acme(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: AppColor.withColor,
  );
  static TextStyle textStyle20 = GoogleFonts.abel(
    color: AppColor.blackColor,
    fontSize: 20.sp,
  );
  static TextStyle textStyle18 = GoogleFonts.acme(
    color: AppColor.withColor,
    fontSize: 18.sp,
  );
}
