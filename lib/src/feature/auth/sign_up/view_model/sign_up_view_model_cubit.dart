import 'dart:io';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tactic_zone/src/data/firebase_service/firebase_service.dart';
import 'package:tactic_zone/src/data/model/app_user.dart';

import '../../../../utils/app_shared_preferences.dart';

part 'sign_up_view_model_state.dart';

class SignUpViewModelCubit extends Cubit<SignUpViewModelState> {
  SignUpViewModelCubit() : super(SignUpViewModelInitial());
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  Future<void> signUp() async {
    if (formKey.currentState!.validate()) {
      emit(LoadingSignUpViewModel());
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
        await FirebaseService.addUser(
          AppUser(
            id: FirebaseAuth.instance.currentUser!.uid,
            name: userNameController.text,
            email: emailController.text,
          ),
        );
        SharedPreferencesUtils.saveData(
            key: "token", value: FirebaseAuth.instance.currentUser!.uid);
        emit(SuccessSignUpViewModel());
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          emit(ErrorSignUpViewModel(
              'The account already exists for that email.'));
        }
      } on SocketException {
        emit(ErrorSignUpViewModel("No Internet Connection"));
      } catch (e) {
        emit(ErrorSignUpViewModel(e.toString()));
      }
    }
  }
}
