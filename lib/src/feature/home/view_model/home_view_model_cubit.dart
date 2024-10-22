import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

import '../../../data/api/api_manage.dart';
import '../../../data/models/response/data_response_video.dart';

part 'home_view_model_state.dart';

class HomeViewModelCubit extends Cubit<HomeViewModelState> {
  HomeViewModelCubit() : super(HomeViewModelInitial());
  DataResponseVideo? data;
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

  Future<void> getDataMatch() async {
    emit(HomeViewModelLoading());
    await _getUrlFromFirebase();

    var either = await ApiManage.getResponseDataVideo(url: url);

    either.fold((l) {
      emit(HomeViewModelError(message: l.errorMessage ?? "Error"));
    }, (r) {
      data = r;
      emit(HomeViewModelSuccess());
    });
  }
}
