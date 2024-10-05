part of 'sgin_in_view_model_cubit.dart';

@immutable
abstract class SignInViewModelState {}

class SignInViewModelInitial extends SignInViewModelState {}

class LoadingSignInViewModel extends SignInViewModelState {}

class SuccessSignInViewModel extends SignInViewModelState {}

class ErrorSignInViewModel extends SignInViewModelState {
  final String message;
  ErrorSignInViewModel(this.message);
}
