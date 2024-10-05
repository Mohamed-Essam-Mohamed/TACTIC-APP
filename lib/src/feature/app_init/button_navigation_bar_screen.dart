import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tactic_zone/src/feature/chat/view/chat_screen.dart';
import 'package:tactic_zone/src/feature/home/view/home_screen.dart';
import 'package:tactic_zone/src/feature/tactic/view/tactic_screen.dart';
import 'package:tactic_zone/src/feature/upload/view/upload_screen.dart';
import 'package:tactic_zone/src/utils/app_color.dart';

import '../profile/view/profile_screen.dart';

class ButtonNavigationBarScreen extends StatefulWidget {
  static String routeName = 'ButtonNavigationBar';
  const ButtonNavigationBarScreen({super.key});

  @override
  State<ButtonNavigationBarScreen> createState() =>
      _ButtonNavigationBarScreenState();
}

class _ButtonNavigationBarScreenState extends State<ButtonNavigationBarScreen> {
  List<Widget> screensRoutes = const [
    HomeScreen(),
    UploadScreen(),
    ProfileScreen()
  ];
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/image/background-home.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          screensRoutes[currentIndex],
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: const Color(0xfffefaff),
        color: AppColor.primaryColor,
        height: MediaQuery.of(context).size.height * 0.07,
        index: 1,
        items: [
          SvgPicture.asset(
            "assets/icon/home-icon.svg",
            height: 40.h,
            width: 40.w,
          ),
          SvgPicture.asset(
            "assets/icon/upload-icon.svg",
            height: 40.h,
            width: 40.w,
          ),
          SvgPicture.asset(
            "assets/icon/person-icon.svg",
            height: 40.h,
            width: 40.w,
          ),
        ],
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
