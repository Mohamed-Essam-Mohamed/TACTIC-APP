import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tactic_zone/src/utils/app_text_style.dart';
import 'package:tactic_zone/src/widget/button_app_widget.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 30.w),
          padding: EdgeInsets.symmetric(horizontal: 50.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            image: const DecorationImage(
              image: AssetImage("assets/image/rectangle-profile.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            children: [
              Gap(40.h),
              Text(
                "Your team match",
                style: AppTextStyle.textStyle30,
                overflow: TextOverflow.ellipsis,
              ),
              Gap(40.h),
              ButtonAppWidget(
                onPressed: () {},
                text: "Upload",
                minWidth: 190,
              ),
              Gap(40.h),
              Text(
                "Your opponent match",
                style: AppTextStyle.textStyle30,
                overflow: TextOverflow.ellipsis,
              ),
              Gap(40.h),
              ButtonAppWidget(
                onPressed: () {},
                text: "Upload",
                minWidth: 190,
              ),
              Gap(40.h),
            ],
          ),
        ),
      ],
    );
  }
}
