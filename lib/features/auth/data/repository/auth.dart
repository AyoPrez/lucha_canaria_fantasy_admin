import 'package:lucha_canaria_fantasy_admin/features/auth/data/model/user.dart';

abstract class Auth {
  Future<bool> signIn({required String username, required String password});
  Future<bool> register({required String username, required String email, required String password});
  Future<User?> getUser();
  Future<void> forgotPassword({required String email});
  Future<bool> logOut();
}