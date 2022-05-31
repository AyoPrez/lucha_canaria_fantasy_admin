import 'package:get_it/get_it.dart';
import 'package:lucha_canaria_fantasy_admin/core/services/parse_service.dart';
import 'package:lucha_canaria_fantasy_admin/features/auth/data/repository/auth.dart';
import 'package:lucha_canaria_fantasy_admin/features/auth/data/repository/impl/auth_impl.dart';
import 'package:lucha_canaria_fantasy_admin/features/auth/presenter/auth_presenter.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/data/repository/impl/teams_repo_impl.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/data/repository/teams_repo.dart';
import 'package:lucha_canaria_fantasy_admin/features/teams/presenter/teams_presenter.dart';

final locator = GetIt.instance;

Future<void> init() async {
  //Parse
  locator.registerLazySingleton(() => ParseService());

  locator.registerLazySingleton<Auth>(() => AuthImpl(locator()));
  locator.registerLazySingleton<AuthPresenter>(() => AuthPresenterImpl(locator()));

  locator.registerLazySingleton<TeamsRepo>(() => TeamsRepoImpl());
  locator.registerLazySingleton<TeamsPresenter>(() => TeamsPresenterImpl(locator()));
}

