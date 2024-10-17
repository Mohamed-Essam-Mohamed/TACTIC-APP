import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:tactic_zone/src/app/constant/api_const/api_const.dart';
import 'package:tactic_zone/src/data/api/api_manage.dart';
import 'package:tactic_zone/src/data/models/request/message_request.dart';
import 'package:tactic_zone/src/data/models/response/messaeg_response.dart';

part 'chat_view_model_state.dart';

class ChatViewModelCubit extends Cubit<ChatViewModelState> {
  ChatViewModelCubit() : super(ChatViewModelInitial());

  var messageController = TextEditingController();
  bool validSendMessage = false;
  List<MessageResponse> listMessages = [];

  void changeValidSendMessage() {
    validSendMessage = messageController.text.isNotEmpty;
    if (messageController.text.isNotEmpty) {
      validSendMessage = true;
    } else {
      validSendMessage = false;
    }
    emit(ChatChangeStateValidSend());
  }

  Future<void> sendMessage() async {
    emit(ChatSendMessageLoading());
    var either = await ApiManage.responseChatMessage(
      message: messageController.text,
      messageRequest: MessageRequest(
        files: FilesData(
          bestFormationsUrl: ApiConst.bestFormationsUrl,
          generatedPlayerDataUrl: ApiConst.generatedPlayerDataUrl,
          myTeamUrl: ApiConst.myTeamUrl,
          opponentTeamUrl: ApiConst.opponentTeamUrl,
          selectedPlayersUrl: ApiConst.selectedPlayersUrl,
        ),
      ),
    );
    listMessages.add(MessageResponse(
        response: messageController.text, senderType: SenderType.user));
    either.fold(
      (l) {
        log("error?????${l.errorMessage}");
        listMessages.add(MessageResponse(
            response: messageController.text, senderType: SenderType.ai));
        emit(ChatSendMessageSuccess(listMessages: listMessages));
      },
      (r) {
        listMessages.add(
            MessageResponse(response: r.response, senderType: SenderType.ai));
        emit(ChatSendMessageSuccess(listMessages: listMessages));
      },
    );
  }
}
