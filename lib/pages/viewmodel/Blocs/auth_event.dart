part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});

}

class ResgisterEvent extends AuthEvent {
   final String email;
  final String password;

  ResgisterEvent({required this.email, required this.password});
}
