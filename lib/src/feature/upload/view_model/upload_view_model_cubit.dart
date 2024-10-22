import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tactic_zone/src/data/api/api_manage.dart';

part 'upload_view_model_state.dart';

class UploadViewModelCubit extends Cubit<UploadViewModelState> {
  UploadViewModelCubit() : super(UploadViewModelInitial());
  var firstVideoController = TextEditingController();
  var secondVideoVideoController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String url = "";
  Future<void> _getUrlFromFirebase() async {
    try {
      final snapshot =
          await FirebaseDatabase.instance.ref().child('API_URL').once();
      url = snapshot.snapshot.value.toString();
    } catch (e) {
      log('${e.toString()}????');
    }
  }

  Future<void> uploadVideo() async {
    if (formKey.currentState!.validate()) {
      emit(UploadViewModelLoding());
      await _getUrlFromFirebase();
      var either = await ApiManage.uploadLinkVideo(
          firstVideo: firstVideoController.text,
          secondVideo: secondVideoVideoController.text,
          url: url);
      either.fold((l) {
        emit(UploadViewModelError(error: l.errorMessage ?? "Error"));
      }, (r) {
        firstVideoController.clear();
        secondVideoVideoController.clear();
        emit(UploadViewModelSuccess());
      });
    }
  }
}
