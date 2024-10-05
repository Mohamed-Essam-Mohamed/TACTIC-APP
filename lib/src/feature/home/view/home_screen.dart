// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tactic_zone/src/feature/chat/view/chat_screen.dart';
import 'package:tactic_zone/src/feature/home/view/widget/container_tile_widget.dart';
import 'package:tactic_zone/src/utils/app_color.dart';
import 'package:tactic_zone/src/widget/button_app_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 80.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ButtonAppWidget(onPressed: () {}, text: "New request"),
          Gap(10.h),
          const Divider(
            color: AppColor.blackColor,
            thickness: 2,
          ),
          Gap(30.h),
          ContainerTileWidget(
            nameMatch: "match title 1",
            onTapChat: () {
              Navigator.of(context).pushNamed(ChatScreen.routeName);
            },
            onTapTactic: () {},
          ),
          Gap(30.h),
          ContainerTileWidget(
            nameMatch: "match title 2",
            onTapChat: () {},
            onTapTactic: () {},
          ),
        ],
      ),
    );
  }
}
