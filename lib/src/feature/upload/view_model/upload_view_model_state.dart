// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'upload_view_model_cubit.dart';

@immutable
abstract class UploadViewModelState {}

class UploadViewModelInitial extends UploadViewModelState {}

class UploadViewModelLoding extends UploadViewModelState {}

class UploadViewModelSuccess extends UploadViewModelState {}

class UploadViewModelError extends UploadViewModelState {
  String error;
  UploadViewModelError({
    required this.error,
  });
}
