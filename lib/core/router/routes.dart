import 'package:fluro/fluro.dart';
import 'package:lucha_canaria_fantasy_admin/features/auth/ui/create_account.dart';
import 'package:lucha_canaria_fantasy_admin/features/auth/ui/forgot_password.dart';
import 'package:lucha_canaria_fantasy_admin/features/auth/ui/login.dart';
import 'package:lucha_canaria_fantasy_admin/features/main/ui/MainScreen.dart';
import 'package:lucha_canaria_fantasy_admin/features/splash_screen/ui/SplashScreen.dart';

class Routes {
  static final FluroRouter router = FluroRouter();

  static final Handler _splashScreen = Handler(handlerFunc: (context, parameters) => const SplashScreen());

  static final Handler _loginScreen = Handler(handlerFunc: (context, parameters) => const Login());

  static final Handler _forgotPasswordScreen = Handler(handlerFunc: (context, parameters) => const ForgotPassword());

  static final Handler _registerScreen = Handler(handlerFunc: (context, parameters) => const CreateAccount());

  static final Handler _mainScreen = Handler(handlerFunc: (context, parameters) => const MainScreen());

  static void setupRouter() {
    router.define('/', handler: _splashScreen);
    router.define('/iniciar', handler: _loginScreen, transitionType: TransitionType.fadeIn);
    router.define('/registro', handler: _registerScreen, transitionType: TransitionType.native);
    router.define('/recuperar_contraseña', handler: _forgotPasswordScreen, transitionType: TransitionType.native);
    router.define('/principal', handler: _mainScreen);
  }
}