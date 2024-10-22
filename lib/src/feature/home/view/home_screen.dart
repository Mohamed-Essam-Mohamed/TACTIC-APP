// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tactic_zone/src/feature/chat/view/chat_screen.dart';
import 'package:tactic_zone/src/feature/home/view/widget/container_tile_widget.dart';
import 'package:tactic_zone/src/feature/home/view_model/home_view_model_cubit.dart';
import 'package:tactic_zone/src/feature/static_page/static_page.dart';
import 'package:tactic_zone/src/utils/app_color.dart';
import 'package:tactic_zone/src/utils/app_text_style.dart';
import 'package:tactic_zone/src/widget/button_app_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeViewModelCubit viewModel = HomeViewModelCubit();

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
            BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
              bloc: viewModel..getDataMatch(),
              builder: (context, state) {
                if (state is HomeViewModelError) {
                  return Center(
                    child: Text(
                      "${state.message ?? "Error"}",
                      style: AppTextStyle.textStyle20,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }
                if (state is HomeViewModelSuccess) {
                  return ContainerTileWidget(
                    nameMatch: "match title 1",
                    supTitel: viewModel.data!.message == ""
                        ? "finihsed..."
                        : "processing...",
                    onTapChat: viewModel.data!.message == ""
                        ? () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ChatScreen()));
                          }
                        : null,
                    onTapTactic: viewModel.data!.message == ""
                        ? () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => StaticPage(
                                  data: viewModel.data,
                                ),
                              ),
                            );
                          }
                        : null,
                  );
                }
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: AppColor.primaryColor,
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ));
  }
}
