import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: Center(
        child: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                // Naviguer vers l'écran suivant
              } else if (state is LoginFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const CircularProgressIndicator();
                }
                return Center(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.login), // Icône de connexion
                    label: const Text('Se connecter avec Google'),
                    onPressed: () =>
                        context.read<LoginCubit>().loginWithGoogle(),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color(0xFF6B8763),
                      // Couleur du texte et de l'icône
                      elevation: 2,
                      // Ombre du bouton
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0), // Bord arrondi
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10), // Espacement interne
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
