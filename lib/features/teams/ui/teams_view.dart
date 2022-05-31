import 'package:lucha_canaria_fantasy_admin/features/teams/data/model/team.dart';

abstract class TeamsView {
  void serveTeams(List<Team> teams);
  void displayErrorDialog(Exception? exception);
}