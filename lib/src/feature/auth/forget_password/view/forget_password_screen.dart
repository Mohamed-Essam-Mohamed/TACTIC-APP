import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactic_zone/src/utils/app_color.dart';
import 'package:tactic_zone/src/widget/button_app_widget.dart';
import 'package:tactic_zone/src/widget/text_form_filed_widget.dart';

import '../../../../utils/app_dialog.dart';
import '../view_model/forget_password_view_model_cubit.dart';

class ForGetPassword extends StatelessWidget {
  static const String routeName = 'ForGetPassword';
  ForGetPassword({super.key});
  ForgetPasswordViewModelCubit viewModel = ForgetPasswordViewModelCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ForgetPasswordViewModelCubit,
          ForgetPasswordViewModelState>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is LoadingForgetPasswordViewModel) {
            return AppDialog.showLoading(context, "loading...");
          }
          if (state is ErrorForgetPasswordViewModel) {
            Navigator.pop(context);
            return AppDialog.showMessageError(
                context: context, message: state.message);
          }
          if (state is SuccessForgetPasswordViewModel) {
            Navigator.pop(context);
            return AppDialog.showMessage(
              context: context,
              message: "Please check your email to reset your password",
            );
          }
        },
        child: Stack(
          children: [
            Image.asset(
              "assets/image/background-auth.png",
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
                      TextFormFiledWidget(
                        hintText: "email",
                        validator: (text) {
                          if (text!.trim().isEmpty) {
                            return "Please enter your email";
                          }
                          return null;
                        },
                        controller: viewModel.emailController,
                      ),
                      Gap(32.h),
                      ButtonAppWidget(
                        onPressed: () async {
                          await viewModel.forgetPassword();
                        },
                        text: "Submit",
                        fonSize: 32,
                        minWidth: 190,
                      ),
                      Text(
                        "or",
                        style: GoogleFonts.acme(
                          fontSize: 30.sp,
                          color: AppColor.withColor,
                        ),
                      ),
                      ButtonAppWidget(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        text: "Sign In",
                        fonSize: 32,
                        minWidth: 190,
                        color: Colors.transparent,
                      ),
                      Gap(20.h),
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
