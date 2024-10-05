part of 'forget_password_view_model_cubit.dart';

@immutable
abstract class ForgetPasswordViewModelState {}

class ForgetPasswordViewModelInitial extends ForgetPasswordViewModelState {}

class SuccessForgetPasswordViewModel extends ForgetPasswordViewModelState {}

class ErrorForgetPasswordViewModel extends ForgetPasswordViewModelState {
  final String message;
  ErrorForgetPasswordViewModel(this.message);
}

class LoadingForgetPasswordViewModel extends ForgetPasswordViewModelState {}
