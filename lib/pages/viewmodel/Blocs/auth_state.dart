part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

//---Login_State---//

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {}

class LoginFailure extends AuthState {
  String message;
 LoginFailure(this.message);
}

//---Resgister_State---//

class ResgisterLoading extends AuthState {}

class ResgisterSuccess extends AuthState {}

class ResgisterFailure extends AuthState {
  String message;
  ResgisterFailure(this.message);
}
