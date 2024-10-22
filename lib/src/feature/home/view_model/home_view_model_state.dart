part of 'home_view_model_cubit.dart';

@immutable
abstract class HomeViewModelState {}

class HomeViewModelInitial extends HomeViewModelState {}

class HomeViewModelSuccess extends HomeViewModelState {}

class HomeViewModelError extends HomeViewModelState {
  String message;
  HomeViewModelError({required this.message});
}

class HomeViewModelLoading extends HomeViewModelState {}
