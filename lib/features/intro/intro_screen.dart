import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobile_app/features/intro/widgets/intro_bottom_bar.dart';
import 'package:mobile_app/shared/nxtgame_colors.dart';
import 'package:mobile_app/shared/widgets/nxtgame_texts.dart';

class IntroScreen extends StatelessWidget {
  IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SvgPicture.asset(
                    "assets/svg/team-svgrepo-com.svg",
                    fit: BoxFit.fitWidth,
                    colorFilter: const ColorFilter.mode(
                        NxtGameColors.black, BlendMode.srcIn),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: NxtGameTitle("CreateTeamIntroTitle".tr()),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: NxtGameDescription("CreateTeamIntroDescription".tr()),
              )
            ],
          ),
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: IntroBottomBar(
              onNext: onNext,
              onPass: onPass,
            )));
  }

  void onNext() {
    print("Suivant");
  }

  void onPass() {
    print("Passer");
  }
}
