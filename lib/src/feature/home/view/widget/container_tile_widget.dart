import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:tactic_zone/src/utils/app_text_style.dart';

import '../../../../utils/app_color.dart';

class ContainerTileWidget extends StatelessWidget {
  const ContainerTileWidget(
      {super.key,
      required this.nameMatch,
      required this.onTapChat,
      required this.supTitel,
      required this.onTapTactic});
  final String nameMatch;
  final void Function()? onTapChat;
  final void Function()? onTapTactic;
  final String supTitel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: const Color(0xffACD573),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                nameMatch,
                style: AppTextStyle.textStyle30,
              ),
              Text(
                supTitel,
                style: AppTextStyle.textStyle20
                    .copyWith(color: AppColor.withColor, fontSize: 24),
              ),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onTapChat,
            child: SvgPicture.asset(
              "assets/icon/chat-icon.svg",
              height: 35.h,
              width: 35.w,
            ),
          ),
          Gap(10.w),
          Container(
            height: 50.h,
            width: 1.w,
            color: AppColor.withColor,
          ),
          Gap(10.w),
          GestureDetector(
            onTap: onTapTactic,
            child: SvgPicture.asset(
              "assets/icon/tactic-icon.svg",
              height: 35.h,
              width: 35.w,
            ),
          ),
        ],
      ),
    );
  }
}
