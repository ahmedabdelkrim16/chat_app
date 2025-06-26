import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<ResgisterEvent>(
      (event, emit) async {
        emit(ResgisterLoading());
        try {
          UserCredential user =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: event.email,
            password: event.password,
          );
          emit(ResgisterSuccess());
        } on FirebaseAuthException catch (ex) {
          if (ex.code == 'weak-password') {
            emit(ResgisterFailure('The password provided is too weak.'));
          } else if (ex.code == 'email-already-in-use') {
            emit(
                ResgisterFailure('The account already exists for that email.'));
          }
        } catch (e) {
          emit(
            ResgisterFailure('حدث خطأ غير متوقع'),
          );
        }
      },
    );

    on<LoginEvent>((event, emit) async {
      emit(LoginLoading());
      try {
        UserCredential user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: event.email, password: event.password);
        emit(LoginSuccess());
      } on FirebaseAuthException catch (ex) {
        if (ex.code == 'user-not-found') {
          emit(LoginFailure('No user found for that email.'));
        } else if (ex.code == 'wrong-password') {
          emit(LoginFailure('Wrong password provided for that user.'));
        }
      } catch (e) {
        emit(LoginFailure('حدث خطأ غير متوقع'));
      }
    });
  }
}
