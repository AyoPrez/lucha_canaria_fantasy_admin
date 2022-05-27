import 'package:flutter/material.dart';

class MainDesktopBody extends StatelessWidget {
  const MainDesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Row(
        children: [
          sideMenuPanel(),
          mainContent()
        ],
      ),
    );
  }

  Widget sideMenuPanel() {
    return Expanded(
      child: ListView(
        children: [
          ListTile(title: Text("Últimas actualizaciones", style: TextStyle(backgroundColor: Colors.white)),),
          ListTile(title: Text("Resultados")),
          ListTile(title: Text("Equipos")),
          ListTile(title: Text("Ajustes")),
          ListTile(title: Text("Menu E")),
          ListTile(title: Text("Menu F")),
          ListTile(title: Text("Menu G")),
          ListTile(title: Text("Menu H")),
          ListTile(title: Text("Menu I")),
        ],
      ),
    );
  }

  Widget mainContent() {
    return Expanded(
      child: Container(
        child: Center(child: Text('Content')),
        color: Colors.black26,
      ),
    );
  }
}