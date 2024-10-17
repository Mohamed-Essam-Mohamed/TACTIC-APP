class MessageResponse {
  String? response;
  DateTime? dateTime = DateTime.now();
  SenderType senderType = SenderType.user;

  MessageResponse({this.response, this.senderType = SenderType.user});

  MessageResponse.fromJson(Map<String, dynamic> json) {
    response = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['response'] = this.response;
    return data;
  }
}

enum SenderType { user, ai }
