import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tactic_zone/src/data/firebase_service/firebase_service.dart';
import 'package:tactic_zone/src/data/models/app_user.dart';

import '../../../utils/app_shared_preferences.dart';

part 'profile_view_model_state.dart';

class ProfileViewModelCubit extends Cubit<ProfileViewModelState> {
  ProfileViewModelCubit() : super(ProfileViewModelInitial());
  AppUser? user;
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  void getProfile() async {
    emit(ProfileViewModelLoading());
    try {
      var _tokenUser = SharedPreferencesUtils.getData(key: "token") as String;
      user = await FirebaseService.getUser(_tokenUser);
      emit(ProfileViewModelSuccess());
    } on SocketException {
      emit(ProfileViewModelFailure("No Internet Connection"));
    } catch (e) {
      emit(ProfileViewModelFailure(e.toString()));
    }
  }

  Future<void> changePassword() async {
    if (formKey.currentState!.validate()) {
      emit(ProfileViewModelLoading());
      try {
        await FirebaseAuth.instance.currentUser!
            .updatePassword(passwordController.text);
        emit(ProfileViewModelSuccess());
      } on SocketException {
        emit(ProfileViewModelFailure("No Internet Connection"));
      } catch (e) {
        emit(ProfileViewModelFailure(
            "This operation is sensitive and requires recent authentication. Log in again before retrying this request."));
      }
    }
  }
}
