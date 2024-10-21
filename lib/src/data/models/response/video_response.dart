class VideoResponse {
  String? message;
  List<String>? videoPaths;

  VideoResponse({this.message, this.videoPaths});

  VideoResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    videoPaths = json['video_paths'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['video_paths'] = this.videoPaths;
    return data;
  }
}
