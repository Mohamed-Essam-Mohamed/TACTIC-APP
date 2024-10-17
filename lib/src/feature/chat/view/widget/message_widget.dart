import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:tactic_zone/src/data/models/response/messaeg_response.dart';
import 'package:tactic_zone/src/utils/app_color.dart';
import 'package:tactic_zone/src/utils/app_text_style.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget({super.key, required this.message});
  final MessageResponse message;

  @override
  Widget build(BuildContext context) {
    return message.senderType == SenderType.user
        ? SendMessageWidget(message: message)
        : RecivedMessageWidget(message: message);
  }
}

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({super.key, required this.message});
  final MessageResponse message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomPaint(
            painter:
                CustomChatBubble(isOwn: true, color: AppColor.secondaryColor),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 250.w),
                    child: Text(
                      message.response!,
                      style: AppTextStyle.textStyle18,
                      textAlign: TextAlign.end,
                    ),
                  ),
                  Text(
                    DateFormat.jm().format(message.dateTime!),
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecivedMessageWidget extends StatelessWidget {
  const RecivedMessageWidget({super.key, required this.message});
  final MessageResponse message;

  @override
  Widget build(BuildContext context) {
    DateTime date = message.dateTime!;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CustomPaint(
            painter:
                CustomChatBubble(isOwn: false, color: AppColor.primaryColor),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   message.senderName,
                  //   style: TextStyle(
                  //     fontSize: 13.sp,
                  //     color: const Color(0xff029ae6),
                  //   ),
                  // ),
                  Container(
                    constraints: BoxConstraints(maxWidth: 300.w),
                    child: Text(
                      message.response!,
                      style: AppTextStyle.textStyle18,
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Text(
                    DateFormat.jm().format(date),
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomChatBubble extends CustomPainter {
  CustomChatBubble({required this.color, required this.isOwn});

  final Color color;
  final bool isOwn;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    Path paintBubbleTail() {
      late Path path;

      if (!isOwn) {
        path = Path()
          ..moveTo(5, size.height - 5)
          ..quadraticBezierTo(-5, size.height, -16, size.height - 4)
          ..quadraticBezierTo(-5, size.height - 5, 0, size.height - 17);
      }

      if (isOwn) {
        path = Path()
          ..moveTo(
            size.width - 6,
            size.height - 4,
          )
          ..quadraticBezierTo(
            size.width + 5,
            size.height,
            size.width + 16,
            size.height - 4,
          )
          ..quadraticBezierTo(
            size.width + 5,
            size.height - 5,
            size.width,
            size.height - 17,
          );
      }

      return path;
    }

    final RRect bubbleBody = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height,
      ),
      const Radius.circular(16),
    );
    final Path bubbleTail = paintBubbleTail();

    canvas.drawRRect(bubbleBody, paint);
    canvas.drawPath(bubbleTail, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
