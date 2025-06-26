part of 'resgister_cubit.dart';

@immutable
abstract class ResgisterState {}

class ResgisterInitial extends ResgisterState {}

class ResgisterLoading extends ResgisterState {}

class ResgisterSuccess extends ResgisterState {}

class ResgisterFailure extends ResgisterState {
  final String message;

  ResgisterFailure(this.message);
}
