part of 'chat_view_model_cubit.dart';

@immutable
abstract class ChatViewModelState {}

class ChatViewModelInitial extends ChatViewModelState {}

class ChatChangeStateValidSend extends ChatViewModelState {}

class ChatSendMessageLoading extends ChatViewModelState {}

class ChatSendMessageSuccess extends ChatViewModelState {
  List<MessageResponse> listMessages;

  ChatSendMessageSuccess({required this.listMessages});
}

class ChatSendMessageError extends ChatViewModelState {
  final String error;
  ChatSendMessageError(this.error);
}
