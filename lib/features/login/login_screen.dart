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
                return ElevatedButton(
                  onPressed: () => context.read<LoginCubit>().loginWithGoogle(),
                  child: const Text('Se connecter avec Google'),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
