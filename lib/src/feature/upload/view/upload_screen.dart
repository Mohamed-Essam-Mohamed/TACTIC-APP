import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tactic_zone/src/feature/upload/view_model/upload_view_model_cubit.dart';
import 'package:tactic_zone/src/utils/app_dialog.dart';
import 'package:tactic_zone/src/utils/app_text_style.dart';
import 'package:tactic_zone/src/widget/button_app_widget.dart';
import 'package:tactic_zone/src/widget/text_form_filed_widget.dart';

class UploadScreen extends StatelessWidget {
  UploadScreen({super.key});
  UploadViewModelCubit viewModel = UploadViewModelCubit();

  @override
  Widget build(BuildContext context) {
    return BlocListener<UploadViewModelCubit, UploadViewModelState>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is UploadViewModelLoding) {
          AppDialog.showLoading(context, "Upload Loading...");
        }

        if (state is UploadViewModelError) {
          Navigator.of(context).pop();
          AppDialog.showMessageError(context: context, message: state.error);
        }
        if (state is UploadViewModelSuccess) {
          Navigator.of(context).pop();
          AppDialog.showMessage(
              context: context, message: "Videos are being processed");
        }
      },
      child: Form(
        key: viewModel.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.r),
                image: const DecorationImage(
                  image: AssetImage("assets/image/rectangle-profile.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(40.h),
                  Text(
                    "Your team match",
                    style: AppTextStyle.textStyle30,
                    overflow: TextOverflow.ellipsis,
                  ),
                  TextFormFiledWidget(
                    fontSizeStyle: 17.sp,
                    controller: viewModel.firstVideoController,
                    hintText: 'https://drive.google.com....',
                    colorHintText: Colors.grey,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your team match";
                      }
                      return null;
                    },
                    contentPadding: EdgeInsets.all(5.h),
                  ),
                  Gap(40.h),
                  Text(
                    "Your opponent match",
                    style: AppTextStyle.textStyle30,
                    overflow: TextOverflow.ellipsis,
                  ),
                  TextFormFiledWidget(
                    fontSizeStyle: 17.sp,
                    hintText: 'https://drive.google.com....',
                    colorHintText: Colors.grey,
                    controller: viewModel.secondVideoVideoController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Please enter your opponent match";
                      }
                      return null;
                    },
                    contentPadding: EdgeInsets.all(5.h),
                  ),
                  Gap(40.h),
                  Align(
                    alignment: Alignment.center,
                    child: ButtonAppWidget(
                      onPressed: () async {
                        //! TODO: upload
                        await viewModel.uploadVideo();
                      },
                      text: "Upload",
                      minWidth: 190,
                    ),
                  ),
                  Gap(40.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
