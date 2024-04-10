import 'package:flutter/material.dart';
import 'package:mobile_app/shared/nxtgame_buttons.dart';

class IntroBottomBar extends StatelessWidget {
  const IntroBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Align(
          alignment: Alignment.bottomLeft,
          child: InkWell(
            onTap: () {
              print("tapped");
            },
            child: const Text(
              "Passer",
              style: TextStyle(color: Color(0xFF3EB489)),
            ),
          ),
        ),
        Align(
            alignment: Alignment.bottomRight,
            child: NxtGamePrimaryButton("Suivant", () {})),
      ],
    );
  }
}
