import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tactic_zone/src/feature/auth/sign_up/view_model/sign_up_view_model_cubit.dart';

import '../../../../utils/app_shared_preferences.dart';

part 'sgin_in_view_model_state.dart';

class SignInViewModelCubit extends Cubit<SignInViewModelState> {
  SignInViewModelCubit() : super(SignInViewModelInitial());
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    if (formKey.currentState!.validate()) {
      emit(LoadingSignInViewModel());
      try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );

        SharedPreferencesUtils.saveData(
            key: "token", value: FirebaseAuth.instance.currentUser!.uid);
        emit(SuccessSignInViewModel());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'invalid-credential') {
          emit(ErrorSignInViewModel(
              "Wrong password or Email provided for that user."));
        }
      } on SocketException {
        emit(ErrorSignInViewModel("No Internet Connection"));
      } catch (e) {
        emit(ErrorSignInViewModel(e.toString()));
      }
    }
  }
}
