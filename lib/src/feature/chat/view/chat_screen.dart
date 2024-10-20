// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:intl/intl.dart';
import 'package:tactic_zone/src/data/models/response/messaeg_response.dart';
import 'package:tactic_zone/src/feature/chat/view/widget/message_widget.dart';
import 'package:tactic_zone/src/feature/chat/view_model/chat_view_model_cubit.dart';
import 'package:tactic_zone/src/utils/app_color.dart';

import '../../../utils/app_text_style.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ChatViewModelCubit viewModel = ChatViewModelCubit();

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
          BlocBuilder<ChatViewModelCubit, ChatViewModelState>(
            bloc: viewModel,
            builder: (context, state) {
              return ListView(
                children: [
                  Gap(10.h),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: _showListViewMessage(viewModel.listMessages),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r),
                      ),
                    ),
                    child: TextFormFieldWidget(
                      viewModel: viewModel,
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  GroupedListView _showListViewMessage(List<MessageResponse> listMessage) {
    return GroupedListView<MessageResponse, DateTime>(
      elements: listMessage,
      reverse: true,
      order: GroupedListOrder.DESC,
      groupBy: (element) => DateTime(
        element.dateTime!.year,
        element.dateTime!.month,
        element.dateTime!.day,
      ),
      groupHeaderBuilder: (element) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40.h,
            child: Card(
              color: const Color(0xff2666a3),
              child: Padding(
                padding: EdgeInsets.all(5.sp),
                child: Text(
                  DateFormat.yMMMd().format(
                    element.dateTime!,
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      groupSeparatorBuilder: (element) => Gap(1.h),
      itemBuilder: (context, MessageResponse element) => MessageWidget(
        message: element,
      ),
      itemComparator: (item1, item2) =>
          item1.dateTime!.compareTo(item2.dateTime!),
      useStickyGroupSeparators: true,
      floatingHeader: true,
    );
  }
}

class TextFormFieldWidget extends StatefulWidget {
  TextFormFieldWidget({
    super.key,
    required this.viewModel,
  });
  ChatViewModelCubit viewModel;

  @override
  State<TextFormFieldWidget> createState() => _TextFormFieldWidgetState();
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatViewModelCubit, ChatViewModelState>(
      bloc: widget.viewModel,
      builder: (context, state) {
        return Row(
          children: [
            Expanded(
              child: TextFormField(
                style: AppTextStyle.textStyle30.copyWith(fontSize: 25.sp),
                cursorColor: AppColor.withColor,
                controller: widget.viewModel.messageController,
                onChanged: (text) {
                  widget.viewModel.changeValidSendMessage();
                },
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  fillColor: AppColor.primaryColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Type a message",
                  hintStyle: AppTextStyle.textStyle30.copyWith(fontSize: 25.sp),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: AppColor.withColor,
                radius: 23.r,
                child: IconButton(
                  onPressed: widget.viewModel.validSendMessage
                      ? () async {
                          widget.viewModel.validSendMessage = false;

                          await widget.viewModel.sendMessage();
                          widget.viewModel.messageController.clear();
                          log(widget.viewModel.listMessages[1].response ??
                              'Text');
                        }
                      : null,
                  icon: state is ChatSendMessageLoading
                      ? CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        )
                      : Image.asset(
                          "assets/icon/send-icon.png",
                          color: widget.viewModel.validSendMessage
                              ? AppColor.primaryColor
                              : Colors.grey[400],
                          height: 40.h,
                          width: 40.w,
                          fit: BoxFit.fill,
                        ),
                ),
              ),
            ),
            Gap(10.h),
          ],
        );
      },
    );
  }
}
