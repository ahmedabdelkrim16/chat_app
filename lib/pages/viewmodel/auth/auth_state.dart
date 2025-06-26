part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
// ==LoginState==
class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  final String  message;

  LoginFailure(this.message);

}

// ==ResgisterState==



class ResgisterLoading extends AuthState {}

class ResgisterSuccess extends AuthState {}

class ResgisterFailure extends AuthState {
  final String message;

  ResgisterFailure(this.message);
}