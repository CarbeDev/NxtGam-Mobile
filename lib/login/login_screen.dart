import 'package:flutter/material.dart';
import 'package:mobile_app/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginState = LoginState();

  bool? isSignIn;

  void _handleGoogleSignIn() async {
    isSignIn = await _loginState.loginWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Connexion'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _handleGoogleSignIn,
          child: Text('Se connecter avec Google'),
        ),
      ),
    );
  }
}
