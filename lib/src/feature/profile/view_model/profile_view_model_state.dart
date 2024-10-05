part of 'profile_view_model_cubit.dart';

@immutable
abstract class ProfileViewModelState {}

class ProfileViewModelInitial extends ProfileViewModelState {}

class ProfileViewModelSuccess extends ProfileViewModelState {}

class ProfileViewModelFailure extends ProfileViewModelState {
  final String? message;
  ProfileViewModelFailure(this.message);
}

class ProfileViewModelLoading extends ProfileViewModelState {}
