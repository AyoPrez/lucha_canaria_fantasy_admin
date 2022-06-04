import 'package:file_picker/file_picker.dart';
import 'package:lucha_canaria_fantasy_admin/core/services/exceptions/empty_fields_exception.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/data/model/team.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/data/repository/teams_repo.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/ui/teams_view.dart';

abstract class TeamsPresenter {

  Future<Team> getTeam(String id);
  Future<List<Team>> getAllTeams();
  Future<bool> saveNewTeam(String name, String foundationYear, String localization, PlatformFile? logo);
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
  Future<bool> saveNewTeam(String name, String foundationYear, String location, PlatformFile? logo) async {
    if(name.isEmpty || foundationYear.isEmpty || location.isEmpty || logo == null) {
      teamsView?.displayErrorDialog(EmptyFieldsException());
    }

    final Team team = Team.newTeam(name, logo, foundationYear, location);

    return repo.saveNewTeam(team);
  }

  @override
  Future<void> updateTeam(String id) {
    // TODO: implement updateTeam
    throw UnimplementedError();
  }

}