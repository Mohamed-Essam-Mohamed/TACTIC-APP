import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tactic_zone/src/feature/auth/forget_password/view/forget_password_screen.dart';
import 'package:tactic_zone/src/feature/auth/sign_in/view_model/sgin_in_view_model_cubit.dart';
import 'package:tactic_zone/src/feature/auth/sign_up/view/sign_up_screen.dart';
import 'package:tactic_zone/src/feature/app_init/button_navigation_bar_screen.dart';
import 'package:tactic_zone/src/utils/app_color.dart';
import 'package:tactic_zone/src/widget/button_app_widget.dart';
import 'package:tactic_zone/src/widget/text_form_filed_widget.dart';

import '../../../../utils/app_dialog.dart';

class SignInScreen extends StatelessWidget {
  static const String routeName = 'SignInScreen';
  SignInScreen({super.key});
  SignInViewModelCubit viewModel = SignInViewModelCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SignInViewModelCubit, SignInViewModelState>(
        bloc: viewModel,
        listener: (context, state) {
          if (state is LoadingSignInViewModel) {
            return AppDialog.showLoading(context, "loading...");
          }

          if (state is ErrorSignInViewModel) {
            Navigator.pop(context);
            return AppDialog.showMessageError(
                context: context, message: state.message);
          }
          if (state is SuccessSignInViewModel) {
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Gap(50.h),
                        TextFormFiledWidget(
                          hintText: "email",
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Enter your email";
                            }
                            return null;
                          },
                          controller: viewModel.emailController,
                        ),
                        Gap(32.h),
                        TextFormFiledWidget(
                          hintText: "password",
                          isObscureText: true,
                          showObscureText: true,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return "Enter your password";
                            }
                            return null;
                          },
                          controller: viewModel.passwordController,
                        ),
                        Gap(6.h),
                        Align(
                          alignment: Alignment.topLeft,
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushNamed(ForGetPassword.routeName);
                            },
                            child: Text(
                              "Forget password?",
                              style: GoogleFonts.acme(
                                fontSize: 20.sp,
                                color: AppColor.withColor,
                              ),
                            ),
                          ),
                        ),
                        ButtonAppWidget(
                          onPressed: () async {
                            await viewModel.signIn();
                          },
                          text: "Sign in",
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
                            Navigator.of(context)
                                .pushNamed(SignUpScreen.routeName);
                          },
                          text: "Sign Up",
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
            ),
          ],
        ),
      ),
    );
  }
}
