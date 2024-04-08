import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobile_app/features/login/login_repository.dart';

class LoginSuccess extends LoginState {}

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    try {
      GoogleSignIn googleSignIn;

      if (Platform.isAndroid) {
        String? serverClientId =
            const String.fromEnvironment("GOOGLE_CLIENT_ID");
        if (serverClientId.isEmpty) {
          emit(LoginFailure("google server client id is missing"));
          return;
        }
        googleSignIn =
            GoogleSignIn(serverClientId: "SERVER_CLIENT_ID", scopes: ['email']);
      } else {
        emit(LoginFailure("Not implemented for ${Platform.operatingSystem}"));
        return;
      }

      if (googleSignIn.currentUser != null) {
        await googleSignIn.disconnect();
      }

      GoogleSignInAccount? account = await googleSignIn.signIn();

      if (account == null) {
        emit(LoginFailure("Google sign in was aborted"));
        return;
      }

      String? authCode = account.serverAuthCode;

      if (authCode == null) {
        emit(LoginFailure("No server code returned by Google sign in"));
        return;
      }

      bool loggedIn = await LoginRepository.loginWithGoogle(authCode);
      if (loggedIn) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailure("Failed to log in with Google"));
      }
    } catch (e) {
      print(e.toString());
      emit(LoginFailure(e.toString()));
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
