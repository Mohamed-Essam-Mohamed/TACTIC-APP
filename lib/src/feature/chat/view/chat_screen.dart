// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tactic_zone/src/utils/app_color.dart';

import '../../../utils/app_text_style.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text(
          "Chat Zone",
          style: AppTextStyle.textStyle40,
        ),
        iconTheme: const IconThemeData(color: AppColor.withColor),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/image/background-home.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Column(
            children: [
              Gap(10.h),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.primaryColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.r),
                    topRight: Radius.circular(10.r),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        style:
                            AppTextStyle.textStyle30.copyWith(fontSize: 25.sp),
                        cursorColor: AppColor.withColor,
                        controller: TextEditingController(),
                        onChanged: (text) {},
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          fillColor: AppColor.primaryColor,
                          filled: true,
                          border: InputBorder.none,
                          hintText: "Type a message",
                          hintStyle: AppTextStyle.textStyle30
                              .copyWith(fontSize: 25.sp),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: AppColor.withColor,
                        radius: 23.r,
                        child: IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/icon/send-icon.png",
                            color: AppColor.primaryColor,
                            height: 40.h,
                            width: 40.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    Gap(10.h),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
