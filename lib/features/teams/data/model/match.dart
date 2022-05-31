import 'package:lucha_canaria_fantasy_admin/features/teams/data/model/team.dart';

class Match {
  String id;
  Team homeTeam;
  Team visitorTeam;
  int homeTeamResult;
  int visitorTeamResult;

  Match(this.id, this.homeTeam, this.visitorTeam, this.homeTeamResult, this.visitorTeamResult);
}