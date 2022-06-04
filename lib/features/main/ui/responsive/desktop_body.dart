import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:lucha_canaria_fantasy_admin/core/theme_manager.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/ui/teams_screen.dart';
import 'package:provider/provider.dart';

class MainDesktopBody extends StatelessWidget {
  const MainDesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final PageController page = PageController();
    return Consumer<ThemeNotifier>(
        builder: (context, theme, _) => Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [sideMenuPanel(context, page), mainContent(context, page)],
      ),
    ),
    );
  }

  Widget sideMenuPanel(BuildContext context, PageController page) {
    final List<SideMenuItem> items = [
      SideMenuItem(
        // Priority of item to show on SideMenu, lower value is displayed at the top
        priority: 0,
        title: 'Últimas actualizaciones',
        onTap: () => page.jumpToPage(0),
        icon: Icon(Icons.home),
      ),
      SideMenuItem(
        priority: 1,
        title: 'Equipos',
        onTap: () => page.jumpToPage(1),
        icon: Icon(Icons.shield),
      ),
      SideMenuItem(
        priority: 2,
        title: 'Resultados',
        onTap: () => page.jumpToPage(2),
        icon: Icon(Icons.receipt_sharp),
      ),
      SideMenuItem(
        priority: 3,
        title: 'Ajustes',
        onTap: () => page.jumpToPage(3),
        icon: Icon(Icons.settings),
      ),
      SideMenuItem(
        priority: 4,
        title: 'Cerrar sesión',
        onTap: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.exit_to_app),
      ),
    ];

    return SideMenu(
        // Page controller to manage a PageView
        controller: page,
        // Will shows on top of all items, it can be a logo or a Title text
        title: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Admin/UserName"),
        ),
        // Will show on bottom of SideMenu when displayMode was SideMenuDisplayMode.open
        footer: Text('demo'),
        // Notify when display mode changed
        onDisplayModeChanged: (mode) {
          print(mode);
        },
        // List of SideMenuItem to show them on SideMenu
        items: items,
      );
  }

  Widget mainContent(BuildContext context, PageController page) {
    return Expanded(
      child: PageView(
        controller: page,
        children: [
          pageZero(),
          pageOne(context),
          pageTwo(),
          pageThree()
        ],
      ),
    );
  }

  Widget pageZero(){
    return Container(
      color: Colors.green,
      child: Center(
        child: Text('Últimas actualizaciones'),
      ),
    );
  }

  Widget pageOne(BuildContext context) {
    return TeamsScreen();
  }

  Widget pageTwo() {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text('Resultados'),
      ),
    );
  }

  Widget pageThree() {
    return Container(
      color: Colors.green,
      child: Center(
        child: Text('Ajustes'),
      ),
    );
  }
}
