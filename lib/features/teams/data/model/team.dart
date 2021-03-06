import 'package:file_picker/file_picker.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/data/model/match.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/data/model/player.dart';

class Team {
  String? id;
  String name;
  PlatformFile? logoFile;
  String? logo;
  String yearOfFoundation;
  String location;
  List<Player> players = List.empty();
  List<Match> matches = List.empty();

  Team(this.id, this.name, this.logo, this.yearOfFoundation, this.location);

  Team.newTeam(this.name, this.logoFile, this.yearOfFoundation, this.location);

  Team.withPlayers(this.id, this.name, this.logo, this.yearOfFoundation, this.location, this.players);
}