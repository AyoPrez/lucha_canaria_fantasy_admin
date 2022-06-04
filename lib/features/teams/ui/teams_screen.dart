import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lucha_canaria_fantasy_admin/core/injection.dart';
import 'package:lucha_canaria_fantasy_admin/core/services/exceptions/empty_fields_exception.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/data/model/team.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/presenter/teams_presenter.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/ui/teams_view.dart';

class TeamsScreen extends StatefulWidget {
  const TeamsScreen({Key? key}) : super(key: key);

  @override
  State<TeamsScreen> createState() => _TeamsScreenState();
}

enum TeamScreens { LIST, ADD, UPDATE }

class _TeamsScreenState extends State<TeamsScreen> implements TeamsView {
  final TeamsPresenter presenter = locator.get<TeamsPresenter>();
  TeamScreens teamScreensType = TeamScreens.LIST;
  Team? selectedTeam;

  final nameController = TextEditingController();
  final yearController = TextEditingController();
  final locationController = TextEditingController();
  PlatformFile? imageLogoFile;

  @override
  Widget build(BuildContext context) {
    presenter.setTeamsView(this);

    return FutureBuilder<List<Team>>(
      future: presenter.getAllTeams(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          switch (teamScreensType) {
            case TeamScreens.LIST:
              return teamsWidget(context, snapshot.data!);
            case TeamScreens.ADD:
              return addNewTeamWidget();
            case TeamScreens.UPDATE:
              return teamUpdateWidget();
          }
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }

  Widget teamsWidget(BuildContext context, List<Team> teams) {
    return Container(
      color: Colors.green,
      child: Center(
          child: GridView.builder(
              padding: const EdgeInsets.only(top: 10.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                //maxCrossAxisExtent: 150,
                crossAxisCount: 3,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: teams.length + 1,
              itemBuilder: (context, index) {
                if (teams.isEmpty || index == 0) {
                  return addNewTeamButton();
                } else {
                  final team = teams[index - 1];
                  return teamButton(team);
                }
              }),
      ),
    );
  }

  Widget addNewTeamButton() {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Material(
        color: Colors.white30,
        child: InkWell(
          splashColor: Colors.green,
          onTap: () {
            navigateToSelectedTeam(null);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.add),
              Text(
                AppLocalizations.of(context).addNewTeam,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  Widget teamButton(Team team) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Material(
          color: Colors.white30,
          child: InkWell(
            splashColor: Colors.green,
            onTap: () {
              navigateToSelectedTeam(team);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.network(team.logo!),
                Text(team.name),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget teamUpdateWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedTeam!.name),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              selectedTeam = null;
              teamScreensType = TeamScreens.LIST;
            });
          },
        ),
      ),
      body: Container(),
    );
  }

  Widget addNewTeamWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).addNewTeam),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              selectedTeam = null;
              teamScreensType = TeamScreens.LIST;
            });
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(imageLogoFile == null ? "" : imageLogoFile!.name),
                    ),
                    ElevatedButton(
                      child: Text(AppLocalizations.of(context).teamLogo),
                      onPressed: () async {
                        var picked = await FilePicker.platform.pickFiles();

                        if (picked != null) {
                          setState((){
                            imageLogoFile = picked.files.first;
                          });
                        }
                      },
                    ),
                  ],
                )),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: MouseRegion(
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).teamName,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: MouseRegion(
                child: TextField(
                  controller: yearController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).teamYearOfFoundation,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: MouseRegion(
                child: TextField(
                  controller: locationController,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).teamLocation,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: MouseRegion(
                child: ElevatedButton(
                  onPressed: ((){
                    presenter.saveNewTeam(
                        nameController.value.text,
                        yearController.value.text,
                        locationController.value.text,
                        imageLogoFile
                    );
                  }),
                  child: Text(AppLocalizations.of(context).addNewTeam),
                ),
            ),
            ),
          ],
        ),
      ),
    );
  }

  void navigateToSelectedTeam(Team? team) {
    if (team == null) {
      setState(() {
        selectedTeam = null;
        teamScreensType = TeamScreens.ADD;
      });
    } else {
      setState(() {
        selectedTeam = team;
        teamScreensType = TeamScreens.UPDATE;
      });
    }
  }

  @override
  void serveTeams(List<Team> teams) {
    // TODO: implement serveTeams
  }

  @override
  void displayErrorDialog(Exception? exception) {

    String title = "";
    String text = "";

      if (exception is EmptyFieldsException) {
        title = AppLocalizations.of(context).errorEmptyFieldsTeamDataTitle;
        text = AppLocalizations.of(context).errorEmptyFieldsTeamDataDescription;
      } else {
        title = AppLocalizations.of(context).errorUnknownTitle;
        text = AppLocalizations.of(context).errorUnknownDescription;
      }

    // set up the button
    final Widget okButton = TextButton(
      child: Text(AppLocalizations.of(context).ok),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    final AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
