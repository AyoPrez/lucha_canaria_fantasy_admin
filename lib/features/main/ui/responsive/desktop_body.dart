import 'package:flutter/material.dart';

class MainDesktopBody extends StatelessWidget {
  const MainDesktopBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Row(
        children: [sideMenuPanel(), mainContent()],
      ),
    );
  }

  Widget sideMenuPanel() {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 80.0, 15.0, 15.0),
            child: TextButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Últimas actualizaciones",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Resultados",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Equipos",
                  style: TextStyle(
                      color: Colors.black,
                    fontSize: 18
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              onPressed: () {},
              child: const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(
                  "Ajustes",
                  style: TextStyle(
                      color: Colors.black,
                    fontSize: 18
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget mainContent() {
    return Expanded(
      child: Container(
        color: Colors.black26,
        child: const Center(child: Text('Content')),
      ),
    );
  }
}
