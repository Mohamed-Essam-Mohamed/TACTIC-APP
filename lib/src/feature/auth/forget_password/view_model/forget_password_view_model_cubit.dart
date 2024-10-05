import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'forget_password_view_model_state.dart';

class ForgetPasswordViewModelCubit extends Cubit<ForgetPasswordViewModelState> {
  ForgetPasswordViewModelCubit() : super(ForgetPasswordViewModelInitial());
  var emailController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  Future<void> forgetPassword() async {
    if (formKey.currentState!.validate()) {
      log("in forget password");
      emit(LoadingForgetPasswordViewModel());
      try {
        await _auth.sendPasswordResetEmail(email: emailController.text);
        log("done");
        emit(SuccessForgetPasswordViewModel());
      } on FirebaseAuthException catch (e) {
        emit(ErrorForgetPasswordViewModel(e.code.toString()));
      } on SocketException {
        emit(ErrorForgetPasswordViewModel("No Internet Connection"));
      } catch (e) {
        emit(ErrorForgetPasswordViewModel(e.toString()));
      }
    }
  }
}
