import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/features/intro/intro_cubit.dart';
import 'package:mobile_app/features/intro/widgets/intro_bottom_bar.dart';
import 'package:mobile_app/features/login/login_screen.dart';
import 'package:mobile_app/shared/nxtgame_colors.dart';
import 'package:mobile_app/shared/widgets/nxtgam_texts.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<IntroCubit, IntroState>(builder: (context, state) {
      final introData = state.getData();
      return Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SvgPicture.asset(
                introData.svgPath,
                height: 400,
                width: 400,
                fit: BoxFit.contain,
                colorFilter: const ColorFilter.mode(
                    NxtGameColors.black, BlendMode.srcIn),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: NxtGameTitle(introData.title.tr()),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: NxtGameDescription(introData.description.tr()),
            ),
          ],
        )),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: IntroBottomBar(
            onNext: () {
              if (state.isLastData) {
                navigateToLoginScreen(context);
              } else {
                context.read<IntroCubit>().goNext();
              }
            },
            onPass: () {
              navigateToLoginScreen(context);
            },
          ),
        ),
      );
    });
  }

  void navigateToLoginScreen(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
