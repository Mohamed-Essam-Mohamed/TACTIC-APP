import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tactic_zone/src/feature/auth/forget_password/view/forget_password_screen.dart';
import 'package:tactic_zone/src/feature/auth/sign_in/view/sign_in_screen.dart';
import 'package:tactic_zone/src/feature/auth/sign_up/view/sign_up_screen.dart';
import 'package:tactic_zone/src/feature/app_init/button_navigation_bar_screen.dart';
import 'package:tactic_zone/src/feature/chat/view/chat_screen.dart';
import 'package:tactic_zone/start_screen.dart';

void main() {
  runApp(const TacTicZone());
}

class TacTicZone extends StatelessWidget {
  const TacTicZone({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'TacTicZone',
          debugShowCheckedModeBanner: false,
          initialRoute: StartScreen.routeName,
          routes: {
            StartScreen.routeName: (context) => const StartScreen(),
            SignInScreen.routeName: (context) => const SignInScreen(),
            SignUpScreen.routeName: (context) => const SignUpScreen(),
            ForGetPassword.routeName: (context) => const ForGetPassword(),
            ButtonNavigationBarScreen.routeName: (context) =>
                const ButtonNavigationBarScreen(),
            ChatScreen.routeName: (context) => const ChatScreen(),
          },
        );
      },
    );
  }
}
