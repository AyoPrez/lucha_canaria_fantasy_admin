import 'package:lucha_canaria_fantasy_admin/features/teams/data/model/team.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/data/repository/teams_repo.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/ui/teams_view.dart';

abstract class TeamsPresenter {

  Future<Team> getTeam(String id);
  Future<List<Team>> getAllTeams();
  Future<bool> saveNewTeam();
  Future<void> updateTeam(String id);
  void setTeamsView(TeamsView teamsView);
}

class TeamsPresenterImpl implements TeamsPresenter {

  TeamsView? teamsView;
  TeamsRepo repo;

  TeamsPresenterImpl(this.repo);

  @override
  void setTeamsView(TeamsView teamsView) {
    this.teamsView = teamsView;
  }

  @override
  Future<List<Team>> getAllTeams() {
    return repo.getListOfRegisteredTeams();
  }

  @override
  Future<Team> getTeam(String id) {
    return repo.getTeam(id);
  }

  @override
  Future<bool> saveNewTeam() {
    // TODO: implement saveNewTeam
    throw UnimplementedError();
  }

  @override
  Future<void> updateTeam(String id) {
    // TODO: implement updateTeam
    throw UnimplementedError();
  }

}