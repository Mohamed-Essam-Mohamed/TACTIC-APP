import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactic_zone/src/feature/auth/sign_up/view_model/sign_up_view_model_cubit.dart';
import 'package:tactic_zone/src/utils/app_color.dart';
import 'package:tactic_zone/src/utils/app_dialog.dart';
import 'package:tactic_zone/src/widget/button_app_widget.dart';
import 'package:tactic_zone/src/widget/text_form_filed_widget.dart';

import '../../../app_init/button_navigation_bar_screen.dart';
import '../../function_validator/function_validator.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName = 'SignUpScreen';
  SignUpScreen({super.key});
  SignUpViewModelCubit viewModel = SignUpViewModelCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignUpViewModelCubit, SignUpViewModelState>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is LoadingSignUpViewModel) {
            return AppDialog.showLoading(context, "loading...");
          }
          if (state is ErrorSignUpViewModel) {
            Navigator.pop(context);
            return AppDialog.showMessage(
                context: context, message: state.message!);
          }
          if (state is SuccessSignUpViewModel) {
            Navigator.pushNamed(context, ButtonNavigationBarScreen.routeName);
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
              child: SingleChildScrollView(
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
                          hintText: "username",
                          validator: functionUserNameValidator,
                          controller: viewModel.userNameController,
                        ),
                        Gap(32.h),
                        TextFormFiledWidget(
                          hintText: "email",
                          validator: functionEmailValidator,
                          controller: viewModel.emailController,
                        ),
                        Gap(32.h),
                        TextFormFiledWidget(
                          hintText: "password",
                          validator: functionPasswordValidator,
                          isObscureText: true,
                          showObscureText: true,
                          controller: viewModel.passwordController,
                        ),
                        Gap(20.h),
                        ButtonAppWidget(
                          onPressed: () async {
                            await viewModel.signUp();
                          },
                          text: "Sign Up",
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
                        Gap(5.h),
                      ],
                    ),
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
