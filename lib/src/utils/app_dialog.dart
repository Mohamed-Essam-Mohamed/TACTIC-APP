// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactic_zone/src/utils/app_color.dart';

class AppDialog {
  static void showLoading(BuildContext context, String message) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(color: AppColor.primaryColor),
              const SizedBox(width: 10),
              Text(
                message,
                style: GoogleFonts.acme(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.primaryColor,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  static void showMessage(
      {required BuildContext context, required String message}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: ((context) {
        return AlertDialog(
          backgroundColor: AppColor.primaryColor,
          title: Text(
            "warning".toUpperCase(),
            style: GoogleFonts.acme(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColor.withColor,
            ),
          ),
          content: Text(
            message,
            style: GoogleFonts.acme(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: AppColor.withColor,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "OK",
                style: GoogleFonts.poppins(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColor.blackColor,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
