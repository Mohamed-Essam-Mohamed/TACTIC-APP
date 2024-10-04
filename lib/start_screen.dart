import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactic_zone/src/feature/auth/sign_in/view/sign_in_screen.dart';
import 'package:tactic_zone/src/utils/app_color.dart';
import 'package:tactic_zone/src/widget/button_app_widget.dart';

class StartScreen extends StatelessWidget {
  static const String routeName = "StartScreen";
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/image/background-image.png",
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(280.h),
                ButtonAppWidget(
                  onPressed: () {
                    Navigator.pushNamed(context, SignInScreen.routeName);
                  },
                  text: "Start",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
