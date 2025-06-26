import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());



  // ==Login_Function_Cubit==

  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
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
  }
 // ==Resgister_Function_Cubit==
  Future<void> resgisterUser(
      {required String email, required String password}) async {
    emit(ResgisterLoading());
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(ResgisterSuccess());
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        emit(ResgisterFailure('The password provided is too weak.'));
      } else if (ex.code == 'email-already-in-use') {
        emit(ResgisterFailure('The account already exists for that email.'));
      }
    } catch (e) {
      emit(
        ResgisterFailure('حدث خطأ غير متوقع'),
      );
    }
  }
@override
  void onChange(Change<AuthState> change) {
    
    print(change);
  }
}
