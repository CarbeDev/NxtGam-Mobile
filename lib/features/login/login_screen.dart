import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/features/new_account/new_account_screen.dart';
import 'package:mobile_app/shared/nxtgame_colors.dart';
import 'package:mobile_app/shared/widgets/nxtgam_buttons.dart';

import 'login_cubit.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => LoginCubit(),
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                navigateToNewAccountScreen(context);
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
                    child: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment(0, -0.33),
                          colors: [
                        NxtGameColors.primary,
                        NxtGameColors.white
                      ])),
                  child: Center(
                    child: NxtGamPrimaryButton(
                        text: "LoginWithGoogle".tr(),
                        onPressed: () =>
                            context.read<LoginCubit>().loginWithGoogle(),
                        icon: SvgPicture.asset("assets/svg/google.svg")),
                  ),
                ));
              },
            ),
          ),
        ),
      ),
    );
  }
}

void navigateToNewAccountScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => NewAccountScreen()));
}