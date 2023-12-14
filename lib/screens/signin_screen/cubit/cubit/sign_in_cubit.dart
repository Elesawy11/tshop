import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInInitial());
  bool itemSelected = false;

  void loginUser({required String email, required String password}) async {
    emit(SignInLoading());
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      emit(SignInSuccess());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailure('No user found for that email.'));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailure('Wrong password provided for that user.'));
      }
    } catch (e) {
      emit(SignInFailure(e.toString()));
    }
  }
  void isSelected() {
    itemSelected = !itemSelected;
    if (itemSelected == true) {
      emit(SignInChange());
    } else {
      emit(SignInNotChange());
    }
  }
}
