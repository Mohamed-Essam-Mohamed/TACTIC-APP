class DataResponseVideo {
  String? message;
  MatchSummary? matchSummary;
  Recommendations? recommendations;
  String? possibleFormations;
  String? matchPlayersRecommendation;
  OpponentAnalysis? opponentAnalysis;
  TrainingSuggestions? trainingSuggestions;

  DataResponseVideo({
    this.message = "",
    this.matchSummary,
    this.recommendations,
    this.possibleFormations,
    this.matchPlayersRecommendation,
    this.opponentAnalysis,
    this.trainingSuggestions,
  });

  DataResponseVideo.fromJson(Map<String, dynamic> json) {
    message = json['detail'] ?? "";

    matchSummary = json['match_summary'] != null
        ? MatchSummary.fromJson(json['match_summary'])
        : null;
    recommendations = json['recommendations'] != null
        ? Recommendations.fromJson(json['recommendations'])
        : null;
    possibleFormations = json['possible Formations'];
    matchPlayersRecommendation = json['match players recommendation'];
    opponentAnalysis = json['opponent_analysis'] != null
        ? OpponentAnalysis.fromJson(json['opponent_analysis'])
        : null;
    trainingSuggestions = json['training_suggestions'] != null
        ? TrainingSuggestions.fromJson(json['training_suggestions'])
        : null;
  }
}

class MatchSummary {
  MatchSummaryIn? matchSummaryIn;

  MatchSummary({this.matchSummaryIn});

  MatchSummary.fromJson(Map<String, dynamic> json) {
    matchSummaryIn = json['match_summary'] != null
        ? MatchSummaryIn.fromJson(json['match_summary'])
        : null;
  }
}

class MatchSummaryIn {
  MyTeamPerformance? myTeamPerformance;
  MyTeamPerformance? opponentPerformance;

  MatchSummaryIn({this.myTeamPerformance, this.opponentPerformance});

  MatchSummaryIn.fromJson(Map<String, dynamic> json) {
    myTeamPerformance = json['my_team_performance'] != null
        ? MyTeamPerformance.fromJson(json['my_team_performance'])
        : null;
    opponentPerformance = json['opponent_performance'] != null
        ? MyTeamPerformance.fromJson(json['opponent_performance'])
        : null;
  }
}

class MyTeamPerformance {
  String? formation;
  String? score;
  num? goals;
  num? totalShots;
  num? shotsOnTarget;
  String? totalPossession;
  num? accuratePasses;
  String? passSuccessRate;
  num? keyPasses;
  String? dribblesSuccessRate;
  String? tackleSuccessRate;
  num? corners;

  MyTeamPerformance(
      {this.formation,
      this.score,
      this.goals,
      this.totalShots,
      this.shotsOnTarget,
      this.totalPossession,
      this.accuratePasses,
      this.passSuccessRate,
      this.keyPasses,
      this.dribblesSuccessRate,
      this.tackleSuccessRate,
      this.corners});

  MyTeamPerformance.fromJson(Map<String, dynamic> json) {
    formation = json['formation'];
    score = json['score'];
    goals = json['goals'];
    totalShots = json['total_shots'];
    shotsOnTarget = json['shots_on_target'];
    totalPossession = json['total_possession'];
    accuratePasses = json['accurate_passes'];
    passSuccessRate = json['pass_success_rate'];
    keyPasses = json['key_passes'];
    dribblesSuccessRate = json['dribbles_success_rate'];
    tackleSuccessRate = json['tackle_success_rate'];
    corners = json['corners'];
  }
}

class Recommendations {
  RecommendationsOutput? recommendationsOutput;

  Recommendations({this.recommendationsOutput});

  Recommendations.fromJson(Map<String, dynamic> json) {
    recommendationsOutput = json['recommendations_output'] != null
        ? RecommendationsOutput.fromJson(json['recommendations_output'])
        : null;
  }
}

class RecommendationsOutput {
  BestFormation? bestFormation;
  List<PlayersRecommendations>? playersRecommendations;

  RecommendationsOutput({this.bestFormation, this.playersRecommendations});

  RecommendationsOutput.fromJson(Map<String, dynamic> json) {
    bestFormation = json['best_formation'] != null
        ? BestFormation.fromJson(json['best_formation'])
        : null;
    if (json['players_recommendations'] != null) {
      playersRecommendations = <PlayersRecommendations>[];
      json['players_recommendations'].forEach((v) {
        playersRecommendations!.add(PlayersRecommendations.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.bestFormation != null) {
      data['best_formation'] = this.bestFormation!.toJson();
    }
    if (this.playersRecommendations != null) {
      data['players_recommendations'] =
          this.playersRecommendations!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BestFormation {
  String? formation;

  BestFormation({this.formation});

  BestFormation.fromJson(Map<String, dynamic> json) {
    formation = json['formation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['formation'] = this.formation;
    return data;
  }
}

class PlayersRecommendations {
  String? number;
  String? position;
  String? status;

  PlayersRecommendations({this.number, this.position, this.status});

  PlayersRecommendations.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    position = json['position'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['number'] = this.number;
    data['position'] = this.position;
    data['status'] = this.status;
    return data;
  }
}

class OpponentAnalysis {
  OpponentAnalysisIn? opponentAnalysis;
  List<String>? additionalNotes;

  OpponentAnalysis({this.opponentAnalysis, this.additionalNotes});

  OpponentAnalysis.fromJson(Map<String, dynamic> json) {
    opponentAnalysis = json['opponent_analysis'] != null
        ? OpponentAnalysisIn.fromJson(json['opponent_analysis'])
        : null;
    additionalNotes = json['additional_notes'];
  }
}

class OpponentAnalysisIn {
  List<dynamic>? strengths;
  List<dynamic>? weaknesses;
  List<dynamic>? counterStrategies;

  OpponentAnalysisIn({this.strengths, this.weaknesses, this.counterStrategies});

  OpponentAnalysisIn.fromJson(Map<String, dynamic> json) {
    strengths = json['strengths'];
    weaknesses = json['weaknesses'];
    counterStrategies = json['counter_strategies'];
  }
}

class TrainingSuggestions {
  String? teamTrainingSession;
  List<Worst5PlayersIndividualSessions>? worst5PlayersIndividualSessions;

  TrainingSuggestions(
      {this.teamTrainingSession, this.worst5PlayersIndividualSessions});

  TrainingSuggestions.fromJson(Map<String, dynamic> json) {
    teamTrainingSession = json['team_training_session'];
    if (json['worst_5_players_individual_sessions'] != null) {
      worst5PlayersIndividualSessions = <Worst5PlayersIndividualSessions>[];
      json['worst_5_players_individual_sessions'].forEach((v) {
        worst5PlayersIndividualSessions!
            .add(Worst5PlayersIndividualSessions.fromJson(v));
      });
    }
  }
}

class Worst5PlayersIndividualSessions {
  String? player;
  num? shirtNumber;
  String? drill;

  Worst5PlayersIndividualSessions({this.player, this.shirtNumber, this.drill});

  Worst5PlayersIndividualSessions.fromJson(Map<String, dynamic> json) {
    player = json['player'];
    shirtNumber = json['shirt_number'];
    drill = json['drill'];
  }
}
