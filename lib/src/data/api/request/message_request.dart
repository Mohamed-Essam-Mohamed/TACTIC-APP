class MessageRequest {
  String? question;
  FilesData? files;

  MessageRequest({this.question, this.files});

  MessageRequest.fromJson(Map<String, dynamic> json) {
    question = json['question'];
    files =
        json['files'] != null ? new FilesData.fromJson(json['files']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question'] = this.question;
    if (this.files != null) {
      data['files'] = this.files!.toJson();
    }
    return data;
  }
}

class FilesData {
  String? bestFormationsUrl;
  String? generatedPlayerDataUrl;
  String? myTeamUrl;
  String? opponentTeamUrl;
  String? selectedPlayersUrl;

  FilesData({
    this.bestFormationsUrl,
    this.generatedPlayerDataUrl,
    this.myTeamUrl,
    this.opponentTeamUrl,
    this.selectedPlayersUrl,
  });

  FilesData.fromJson(Map<String, dynamic> json) {
    bestFormationsUrl = json['best_formations_url'];
    generatedPlayerDataUrl = json['generated_player_data_url'];
    myTeamUrl = json['my_team_url'];
    opponentTeamUrl = json['opponent_team_url'];
    selectedPlayersUrl = json['selected_players_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['best_formations_url'] = this.bestFormationsUrl;
    data['generated_player_data_url'] = this.generatedPlayerDataUrl;
    data['my_team_url'] = this.myTeamUrl;
    data['opponent_team_url'] = this.opponentTeamUrl;
    data['selected_players_url'] = this.selectedPlayersUrl;
    return data;
  }
}
