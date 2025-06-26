import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'resgister_state.dart';

class ResgisterCubit extends Cubit<ResgisterState> {
  ResgisterCubit() : super(ResgisterLoading());

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
}
