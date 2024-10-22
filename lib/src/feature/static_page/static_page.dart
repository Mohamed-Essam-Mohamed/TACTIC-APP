import 'package:flutter/material.dart';
import 'package:tactic_zone/src/data/models/response/data_response_video.dart';
import 'package:tactic_zone/src/utils/app_color.dart';
import 'package:tactic_zone/src/utils/app_text_style.dart';

class StaticPage extends StatelessWidget {
  final DataResponseVideo? data;
  const StaticPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text(
          "ٍStatistics Page",
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
            children: [],
          )
        ],
      ),
    );
  }
}
