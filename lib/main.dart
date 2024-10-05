import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tactic_zone/firebase_options.dart';
import 'package:tactic_zone/src/feature/auth/forget_password/view/forget_password_screen.dart';
import 'package:tactic_zone/src/feature/auth/sign_in/view/sign_in_screen.dart';
import 'package:tactic_zone/src/feature/auth/sign_up/view/sign_up_screen.dart';
import 'package:tactic_zone/src/feature/app_init/button_navigation_bar_screen.dart';
import 'package:tactic_zone/src/feature/chat/view/chat_screen.dart';
import 'package:tactic_zone/src/utils/app_shared_preferences.dart';
import 'package:tactic_zone/start_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesUtils.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String? initRoute = StartScreen.routeName;
  var getToken = SharedPreferencesUtils.getData(key: 'token');
  if (getToken != null) {
    initRoute = ButtonNavigationBarScreen.routeName;
  }

  await FirebaseAuth.instance
      .sendPasswordResetEmail(email: "esammww.com@gmail.com");
  runApp(TacTicZone(
    initRoute: initRoute,
  ));
}

class TacTicZone extends StatelessWidget {
  const TacTicZone({super.key, required this.initRoute});
  final String initRoute;

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
          initialRoute: initRoute,
          routes: {
            StartScreen.routeName: (context) => const StartScreen(),
            SignInScreen.routeName: (context) => SignInScreen(),
            SignUpScreen.routeName: (context) => SignUpScreen(),
            ForGetPassword.routeName: (context) => ForGetPassword(),
            ButtonNavigationBarScreen.routeName: (context) =>
                const ButtonNavigationBarScreen(),
            ChatScreen.routeName: (context) => const ChatScreen(),
          },
        );
      },
    );
  }
}
