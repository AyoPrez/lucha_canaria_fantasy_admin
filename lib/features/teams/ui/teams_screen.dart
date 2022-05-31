import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lucha_canaria_fantasy_admin/core/injection.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/data/model/team.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/presenter/teams_presenter.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/ui/teams_view.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

class _TeamsScreenState extends State<TeamsScreen> implements TeamsView {

  final TeamsPresenter presenter = locator.get<TeamsPresenter>();

  @override
  Widget build(BuildContext context) {

    presenter.setTeamsView(this);

    return FutureBuilder<List<Team>>(
      future: presenter.getAllTeams(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return TeamsWidget(context, snapshot.data!);
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }

  Widget TeamsWidget(BuildContext context, List<Team> teams) {
    return Container(
      color: Colors.green,
      child: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: List.generate(teams.length + 1, (index) {
            if(index == 0) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Material(
                    color: Colors.white30,
                    child: InkWell(
                      splashColor: Colors.green,
                      onTap: () {},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Icon(Icons.add),
                          Text(AppLocalizations.of(context).addNewTeam),
                        ],
                      ),
                    ),
                  ),
                )
              );
            } else {
              return Center(
                child: Text(
                    'Item ${teams.elementAt(index).logo}'
                ),
              );
            }
          }),
        ),
      ),
    );
  }

  @override
  void serveTeams(List<Team> teams) {
    // TODO: implement serveTeams
  }

  @override
  void displayErrorDialog(Exception? exception) {
    // TODO: implement displayErrorDialog
  }

}