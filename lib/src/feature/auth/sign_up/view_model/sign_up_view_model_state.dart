part of 'sign_up_view_model_cubit.dart';

@immutable
abstract class SignUpViewModelState {}

class SignUpViewModelInitial extends SignUpViewModelState {}

class LoadingSignUpViewModel extends SignUpViewModelState {}

class SuccessSignUpViewModel extends SignUpViewModelState {}

class ErrorSignUpViewModel extends SignUpViewModelState {
  String? message;

  ErrorSignUpViewModel(this.message);
}
