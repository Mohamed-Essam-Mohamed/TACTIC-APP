class VideoRequest {
  List<String>? videoPaths;

  VideoRequest({this.videoPaths});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['video_paths'] = videoPaths?.join(',');
    return data;
  }

  factory VideoRequest.fromJson(Map<String, dynamic> json) {
    return VideoRequest(
      videoPaths: json['video_paths']?.split(','),
    );
  }
}
