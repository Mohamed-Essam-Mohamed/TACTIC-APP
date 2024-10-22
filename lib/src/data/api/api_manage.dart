import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:tactic_zone/src/app/constant/api_const/api_const.dart';
import 'package:tactic_zone/src/app/failure/failuer.dart';
import 'package:tactic_zone/src/app/failure/net_work_failure.dart';
import 'package:tactic_zone/src/app/failure/server_failure.dart';
import 'package:tactic_zone/src/data/models/request/message_request.dart';
import 'package:tactic_zone/src/data/models/response/data_response_video.dart';
import 'package:tactic_zone/src/data/models/response/messaeg_response.dart';
import 'package:tactic_zone/src/data/models/response/video_response.dart';

class ApiManage {
  static Future<Either<Failure, MessageResponse>> responseChatMessage(
      {required String message, required MessageRequest messageRequest}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse(
            'https://chatbot22-gufkgce6dnhhe9gg.canadacentral-01.azurewebsites.net/ask'),
      );
      request.body = json.encode({
        "question": message,
        "files": messageRequest.toJson()['files'],
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var data = MessageResponse.fromJson(jsonDecode(responseBody));
        log(data.response.toString());
        return Right(data);
      } else {
        return Left(ServerFailure(
            errorMessage: response.reasonPhrase ?? "Something went wrong"));
      }
    } else {
      return Left(NetworkFailure(errorMessage: "No internet connection"));
    }
  }

  static Future<Either<Failure, VideoResponse>> uploadLinkVideo(
      {required String firstVideo,
      required String secondVideo,
      required String url}) async {
    log('in function');
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
        'POST',
        Uri.parse('$url/process_videos'),
      );
      request.body = json.encode({
        "video_paths": ["$firstVideo", "$secondVideo"]
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        var registerResponse = VideoResponse.fromJson(jsonDecode(responseBody));
        log(registerResponse.message.toString());
        return Right(registerResponse);
      } else {
        log('errro');
        return Left(ServerFailure(errorMessage: "Error processing request"));
      }
    } else {
      log('No internet connection');
      return Left(NetworkFailure(errorMessage: "No internet connection"));
    }
  }

  static Future<Either<Failure, DataResponseVideo>> getResponseDataVideo(
      {required String url}) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi)) {
      var request = http.Request('GET', Uri.parse('$url/get_json_outputs'));

      http.StreamedResponse response = await request.send();
      log(response.statusCode.toString());

      return Right(DataResponseVideo.fromJson(
          jsonDecode(await response.stream.bytesToString())));
    } else {
      return Left(NetworkFailure(errorMessage: "No internet connection"));
    }
  }
}




// MessageRequest messageRequest =
//  MessageRequest(
//       files: FilesData(
//         bestFormationsUrl: ApiConst.bestFormationsUrl,
//         generatedPlayerDataUrl: ApiConst.generatedPlayerDataUrl,
//         myTeamUrl: ApiConst.myTeamUrl,
//         opponentTeamUrl: ApiConst.opponentTeamUrl,
//         selectedPlayersUrl: ApiConst.selectedPlayersUrl,
//       ),
//     );