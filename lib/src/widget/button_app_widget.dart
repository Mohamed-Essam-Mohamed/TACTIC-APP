import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactic_zone/src/utils/app_color.dart';
import 'package:tactic_zone/src/utils/app_text_style.dart';

class ButtonAppWidget extends StatelessWidget {
  ButtonAppWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.minWidth = 262,
    this.fonSize = 40,
    this.color = AppColor.primaryColor,
  });
  final String text;
  final void Function()? onPressed;
  double minWidth;
  double fonSize;
  Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      height: 60.h,
      minWidth: minWidth.w,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: GoogleFonts.acme(
          color: AppColor.withColor,
          fontSize: fonSize.sp,
        ),
      ),
    );
  }
}
