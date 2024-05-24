import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_app/features/login/repository/login_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    try {
      final loginRepo = LoginRepository();
      final GoogleSignInAccount? googleUser = await loginRepo.loginWithGoogle();
      if (googleUser == null) {
        throw Exception();
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      final firebaseCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      final loginResponse =
          await loginRepo.getUserInfo(firebaseCredential.user!.uid);

      emit(LoginSuccess(loginResponse.isNewUser));
    } catch (e) {
      print(e);
      emit(LoginFailure("LoginError".tr()));
    }
  }
}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure(this.error);
}

class LoginSuccess extends LoginState {
  final bool isNewUser;

  LoginSuccess(this.isNewUser);
}
