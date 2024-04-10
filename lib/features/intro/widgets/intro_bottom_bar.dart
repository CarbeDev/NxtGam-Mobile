import 'package:flutter/material.dart';
import 'package:mobile_app/shared/nxtgame_colors.dart';
import 'package:mobile_app/shared/widgets/nxtgame_buttons.dart';

class IntroBottomBar extends StatelessWidget {
  const IntroBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: () {
            print("tapped");
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 34.0),
            child: Text(
              "Passer",
              style: TextStyle(color: NxtGameColors.primary),
            ),
          ),
        ),
        NxtGamePrimaryButton("Suivant", () {}),
      ],
    );
  }
}
