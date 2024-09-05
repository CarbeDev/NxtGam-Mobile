import 'package:mobile_app/network/nxtgam_api.dart';

class NxtGameHomeUserResponse extends NxtGamResponse {
  final String username;
  final List<UserJoinedLeagueResponse> leagues;

  NxtGameHomeUserResponse(this.username, this.leagues);

  static NxtGameHomeUserResponse from(Map<dynamic, dynamic> json) {
    return NxtGameHomeUserResponse(
        json["username"],
        (json["leagues"] as List)
            .map((value) => UserJoinedLeagueResponse.from(value))
            .toList());
  }
}

class UserJoinedLeagueResponse {
  final String name;
  final HomeRankingResponse ranking;

  UserJoinedLeagueResponse(this.name, this.ranking);

  static UserJoinedLeagueResponse from(Map<dynamic, dynamic> json) {
    return UserJoinedLeagueResponse(
        json["name"],
        HomeRankingResponse(
            json["ranking"]["user_ranking"], json["ranking"]["total_players"]));
  }
}

class HomeRankingResponse {
  final int userRanking;
  final int totalPlayers;

  HomeRankingResponse(this.userRanking, this.totalPlayers);
}
