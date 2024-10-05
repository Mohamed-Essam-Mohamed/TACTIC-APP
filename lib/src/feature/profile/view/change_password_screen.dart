import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactic_zone/src/feature/auth/function_validator/function_validator.dart';
import 'package:tactic_zone/src/feature/profile/view_model/profile_view_model_cubit.dart';
import 'package:tactic_zone/src/utils/app_color.dart';
import 'package:tactic_zone/src/utils/app_dialog.dart';
import 'package:tactic_zone/src/widget/button_app_widget.dart';
import 'package:tactic_zone/src/widget/text_form_filed_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key, required this.email});
  final String email;
  ProfileViewModelCubit viewModel = ProfileViewModelCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ProfileViewModelCubit, ProfileViewModelState>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is ProfileViewModelLoading) {
            return AppDialog.showLoading(context, "loading...");
          }
          if (state is ProfileViewModelFailure) {
            Navigator.pop(context);
            return AppDialog.showMessageError(
                context: context,
                message: state.message ?? "Something went wrong");
          }
          if (state is ProfileViewModelSuccess) {
            Navigator.pop(context);
            Navigator.pop(context);
          }
        },
        child: Stack(
          children: [
            Image.asset(
              "assets/image/background-home.png",
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 37.w),
                margin: EdgeInsets.only(
                  top: 60.h,
                  left: 20.w,
                  right: 20.w,
                  bottom: 20.h,
                ),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  image: DecorationImage(
                    image: AssetImage("assets/image/rectangle.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Form(
                  key: viewModel.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Gap(50.h),
                      Text(
                        email,
                        style: GoogleFonts.acme(
                          fontSize: 25.sp,
                          color: AppColor.primaryColor,
                        ),
                      ),
                      Gap(50.h),
                      TextFormFiledWidget(
                        hintText: "New Password",
                        isObscureText: true,
                        showObscureText: true,
                        validator: functionPasswordValidator,
                        controller: viewModel.passwordController,
                      ),
                      Gap(32.h),
                      ButtonAppWidget(
                        onPressed: () async {
                          await viewModel.changePassword();
                        },
                        text: "Submit",
                        fonSize: 32,
                        minWidth: 190,
                      ),
                      Gap(50.h),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
