import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactic_zone/src/utils/app_color.dart';
import 'package:tactic_zone/src/widget/button_app_widget.dart';
import 'package:tactic_zone/src/widget/text_form_filed_widget.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'SignUpScreen';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/image/background-auth.png",
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 37.w),
              margin: EdgeInsets.only(
                top: 60.h,
                left: 20.w,
                right: 20.w,
                bottom: 20.h,
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                image: DecorationImage(
                  image: AssetImage("assets/image/rectangle.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gap(50.h),
                  TextFormFiledWidget(
                    hintText: "email",
                    validator: (text) {},
                    controller: TextEditingController(),
                  ),
                  Gap(32.h),
                  TextFormFiledWidget(
                    hintText: "password",
                    validator: (text) {},
                    controller: TextEditingController(),
                  ),
                  Gap(32.h),
                  TextFormFiledWidget(
                    hintText: "confirm password",
                    validator: (text) {},
                    controller: TextEditingController(),
                  ),
                  Gap(20.h),
                  ButtonAppWidget(
                    onPressed: () {},
                    text: "Sign Up",
                    fonSize: 32,
                    minWidth: 190,
                  ),
                  Text(
                    "or",
                    style: GoogleFonts.acme(
                      fontSize: 30.sp,
                      color: AppColor.withColor,
                    ),
                  ),
                  ButtonAppWidget(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    text: "Sign In",
                    fonSize: 32,
                    minWidth: 190,
                    color: Colors.transparent,
                  ),
                  Gap(5.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
