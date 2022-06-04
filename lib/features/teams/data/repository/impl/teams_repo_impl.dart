import 'package:lucha_canaria_fantasy_admin/features/teams/data/model/team.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/data/repository/teams_repo.dart';

class TeamsRepoImpl implements TeamsRepo {

  @override
  Future<List<Team>> getListOfRegisteredTeams() async {
    //return List.empty();
    return [
      Team("01", "Roque Nublo",
        "https://scontent-dub4-1.xx.fbcdn.net/v/t1.6435-9/118633652_3228569343845221_7913374269427504935_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=m-GD4h-IlJgAX-Krmon&_nc_ht=scontent-dub4-1.xx&oh=00_AT9AxMHF7gt7m2FBlFxiLJKyGS6bQkWLVyo-RBYNYB18YQ&oe=62BA3438",
        "1965", "Cruce de Arinaga"),
      Team("02", "Castro Morales",
          "https://scontent.fdub5-1.fna.fbcdn.net/v/t1.6435-9/179473261_3870900949667298_8757766269416390243_n.png?_nc_cat=108&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=RQ4-XyxMqWgAX-Xl-d1&_nc_ht=scontent.fdub5-1.fna&oh=00_AT8IBCltmZtNm5aJNmd2xvYLSVnxuf0G_a5NP7O0BHWqEg&oe=62BE9863",
          "1946", "Las Huesas")];
  }

  @override
  Future<Team> getTeam(String id) async {
    return Team("01", "Roque Nublo",
        "https://scontent-dub4-1.xx.fbcdn.net/v/t1.6435-9/118633652_3228569343845221_7913374269427504935_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=m-GD4h-IlJgAX-Krmon&_nc_ht=scontent-dub4-1.xx&oh=00_AT9AxMHF7gt7m2FBlFxiLJKyGS6bQkWLVyo-RBYNYB18YQ&oe=62BA3438",
        "1955", "Cruce de Arinaga");
  }

  @override
  Future<bool> saveNewTeam(Team team) {
    // TODO: implement saveNewTeam
    throw UnimplementedError();
  }

  @override
  Future<void> updateTeam(String id) {
    // TODO: implement updateTeam
    throw UnimplementedError();
  }

}