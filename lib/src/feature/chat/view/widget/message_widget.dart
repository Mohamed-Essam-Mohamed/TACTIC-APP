
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// class MessageWidget extends StatelessWidget {
//   const MessageWidget({super.key, required this.message});
//   final Message message;

//   @override
//   Widget build(BuildContext context) {
//     var provider = Provider.of<SaveUserProvider>(context);
//     return provider.user?.id == message.senderId
//         ? SendMessageWidget(message: message)
//         : RecivedMessageWidget(message: message);
//   }
// }

// class SendMessageWidget extends StatelessWidget {
//   const SendMessageWidget({super.key, required this.message});
//   final Message message;

//   @override
//   Widget build(BuildContext context) {
//     DateTime date = DateTime.fromMillisecondsSinceEpoch(message.dateTime);

//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.w),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           CustomPaint(
//             painter:
//                 CustomChatBubble(isOwn: true, color: AppColors.secondaryColor),
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Container(
//                     constraints: BoxConstraints(maxWidth: 250.w),
//                     child: Text(
//                       message.content,
//                       style: TextStyle(fontSize: 15.sp),
//                       textAlign: TextAlign.end,
//                     ),
//                   ),
//                   Text(
//                     DateFormat.jm().format(date),
//                     style: TextStyle(
//                       fontSize: 10.sp,
//                       color: Colors.grey.shade600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class RecivedMessageWidget extends StatelessWidget {
//   const RecivedMessageWidget({super.key, required this.message});
//   final Message message;

//   @override
//   Widget build(BuildContext context) {
//     DateTime date = DateTime.fromMillisecondsSinceEpoch(message.dateTime);

//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 15.w),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           CustomPaint(
//             painter:
//                 CustomChatBubble(isOwn: false, color: AppColors.primaryColor),
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 5.h),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     message.senderName,
//                     style: TextStyle(
//                       fontSize: 13.sp,
//                       color: const Color(0xff029ae6),
//                     ),
//                   ),
//                   Container(
//                     constraints: BoxConstraints(maxWidth: 250.w),
//                     child: Text(
//                       message.content,
//                       style: TextStyle(fontSize: 15.sp),
//                       textAlign: TextAlign.start,
//                     ),
//                   ),
//                   Text(
//                     DateFormat.jm().format(date),
//                     style: TextStyle(
//                       fontSize: 10.sp,
//                       color: Colors.grey.shade600,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class CustomChatBubble extends CustomPainter {
//   CustomChatBubble({required this.color, required this.isOwn});

//   final Color color;
//   final bool isOwn;

//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = color;

//     Path paintBubbleTail() {
//       late Path path;

//       if (!isOwn) {
//         path = Path()
//           ..moveTo(5, size.height - 5)
//           ..quadraticBezierTo(-5, size.height, -16, size.height - 4)
//           ..quadraticBezierTo(-5, size.height - 5, 0, size.height - 17);
//       }

//       if (isOwn) {
//         path = Path()
//           ..moveTo(
//             size.width - 6,
//             size.height - 4,
//           )
//           ..quadraticBezierTo(
//             size.width + 5,
//             size.height,
//             size.width + 16,
//             size.height - 4,
//           )
//           ..quadraticBezierTo(
//             size.width + 5,
//             size.height - 5,
//             size.width,
//             size.height - 17,
//           );
//       }

//       return path;
//     }

//     final RRect bubbleBody = RRect.fromRectAndRadius(
//       Rect.fromLTWH(
//         0,
//         0,
//         size.width,
//         size.height,
//       ),
//       const Radius.circular(16),
//     );
//     final Path bubbleTail = paintBubbleTail();

//     canvas.drawRRect(bubbleBody, paint);
//     canvas.drawPath(bubbleTail, paint);
//   }

//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return true;
//   }
// }