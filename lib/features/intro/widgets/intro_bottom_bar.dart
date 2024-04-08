import 'package:flutter/material.dart';
import 'package:mobile_app/shared/buttons.dart';

class IntroBottomBar extends StatelessWidget {
  const IntroBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: ElevatedButton(
            onPressed: () {
              print('Bouton gauche pressé');
            },
            child: const Text('Bouton Gauche'),
          ),
        ),
        Align(
            alignment: Alignment.centerRight,
            child: NxtGamePrimaryButton("Suivant", () {})),
      ],
    );
  }
}
