import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tactic_zone/src/utils/app_text_style.dart';
import 'package:tactic_zone/src/widget/button_app_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
          physics: const BouncingScrollPhysics(),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                height: 400.h,
                width: 400.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50.r),
                  image: const DecorationImage(
                    image: AssetImage("assets/image/rectangle-profile.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(100.h),
                    Text(
                      "Mohamed Esam",
                      style: AppTextStyle.textStyle40,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(10.h),
                    Text(
                      "Email: Mohamed@gmail.com",
                      style: AppTextStyle.textStyle30,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap(30.h),
                    ButtonAppWidget(
                      text: "Change password",
                      onPressed: () {},
                      fonSize: 24,
                      minWidth: 200,
                    )
                  ],
                ),
              ),
              Positioned(
                top: -100,
                left: 100,
                child: Image.asset(
                  "assets/image/profile-image.png",
                  height: 200.h,
                  width: 200.w,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
