import 'package:flutter/material.dart';
import 'package:lucha_canaria_fantasy_admin/core/injection.dart' as di;
import 'package:lucha_canaria_fantasy_admin/core/theme_manager.dart';
import 'package:provider/provider.dart';

import 'core/config_reader.dart';
import 'my_app.dart';

Future<void> mainCommon(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  await ConfigReader.initialize();

  return runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: const MyApp(),
    ),
  );
}
