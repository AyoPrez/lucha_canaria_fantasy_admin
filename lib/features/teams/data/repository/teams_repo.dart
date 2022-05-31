import 'package:lucha_canaria_fantasy_admin/features/teams/data/model/team.dart';

abstract class TeamsRepo {
  Future<List<Team>> getListOfRegisteredTeams();
  Future<Team> getTeam(String id);
  Future<bool> saveNewTeam(Team team);
  Future<void> updateTeam(String id);
}