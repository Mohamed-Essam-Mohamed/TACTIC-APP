import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tactic_zone/src/feature/auth/sign_in/view/sign_in_screen.dart';
import 'package:tactic_zone/src/feature/profile/view/change_password_screen.dart';
import 'package:tactic_zone/src/feature/profile/view_model/profile_view_model_cubit.dart';
import 'package:tactic_zone/src/utils/app_color.dart';
import 'package:tactic_zone/src/utils/app_shared_preferences.dart';
import 'package:tactic_zone/src/utils/app_text_style.dart';
import 'package:tactic_zone/src/widget/button_app_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileViewModelCubit viewModel = ProfileViewModelCubit();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewModel.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileViewModelCubit, ProfileViewModelState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is ProfileViewModelLoading) {
          return const SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: AppColor.primaryColor,
                )
              ],
            ),
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
              physics: const BouncingScrollPhysics(),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 400.h,
                    width: 400.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      image: const DecorationImage(
                        image: AssetImage("assets/image/rectangle-profile.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Gap(100.h),
                        Text(
                          viewModel.user?.name ?? "",
                          style: AppTextStyle.textStyle30,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Gap(10.h),
                        Text(
                          "Email: ${viewModel.user?.email}",
                          style: AppTextStyle.textStyle30,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Gap(30.h),
                        ButtonAppWidget(
                          text: "Change password",
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChangePasswordScreen(
                                  email: viewModel.user?.email ?? "",
                                ),
                              ),
                            );
                          },
                          fonSize: 24,
                          minWidth: 200,
                        ),
                        Gap(20.h),
                        ButtonAppWidget(
                          text: "Logout",
                          onPressed: () async {
                            SharedPreferencesUtils.removeData(key: "token");
                            await FirebaseAuth.instance.signOut();
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                SignInScreen.routeName, (r) => false);
                          },
                          color: AppColor.redColor,
                          fonSize: 24,
                          minWidth: 200,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: -100,
                    left: 100,
                    child: Image.asset(
                      "assets/image/profile-image.png",
                      height: 200.h,
                      width: 200.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
