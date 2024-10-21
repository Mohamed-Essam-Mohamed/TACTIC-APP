import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tactic_zone/src/data/api/api_manage.dart';

part 'upload_view_model_state.dart';

class UploadViewModelCubit extends Cubit<UploadViewModelState> {
  UploadViewModelCubit() : super(UploadViewModelInitial());
  var firstVideoController = TextEditingController();
  var secondVideoVideoController = TextEditingController();

  Future<void> uploadVideo() async {
    emit(UploadViewModelLoding());
    var either = await ApiManage.uploadLinkVideo(
        firstVideo: firstVideoController.text,
        secondVideo: secondVideoVideoController.text);
    either.fold((l) {
      emit(UploadViewModelError(error: l.errorMessage ?? "Error"));
    }, (r) {
      firstVideoController.clear();
      secondVideoVideoController.clear();
      emit(UploadViewModelSuccess());
    });
  }
}
