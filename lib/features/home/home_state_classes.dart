import 'package:mobile_app/features/home/repository/nxtgam_home_responses.dart';

class JoinedLeague {
  final String name;
  final Ranking ranking;

  JoinedLeague({required this.name, required this.ranking});

  static List<JoinedLeague> from(List<UserJoinedLeagueResponse> response) {
    return response
        .map((league) => JoinedLeague(
            name: league.name, ranking: Ranking.from(league.ranking)))
        .toList();
  }
}

class Ranking {
  final int userRanking;
  final int totalPlayer;

  Ranking({required this.userRanking, required this.totalPlayer});

  static Ranking from(HomeRankingResponse response) {
    return Ranking(
        userRanking: response.userRanking, totalPlayer: response.totalPlayers);
  }
}
