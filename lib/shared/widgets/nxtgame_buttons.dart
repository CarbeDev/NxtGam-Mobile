import 'package:flutter/material.dart';
import 'package:mobile_app/shared/nxtgame_colors.dart';

abstract class NxtGameButton extends StatelessWidget {
  final String text;
  final Color background;
  final Color textColor;
  final VoidCallback onPressed;

  const NxtGameButton(
      this.text, this.background, this.textColor, this.onPressed,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(background),
          foregroundColor: MaterialStateProperty.all<Color>(textColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
          padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 34.0)),
        ),
        child: Text(text));
  }
}

class NxtGamePrimaryButton extends NxtGameButton {
  const NxtGamePrimaryButton(String text, VoidCallback onPressed, {super.key})
      : super(text, NxtGameColors.primary, NxtGameColors.white, onPressed);
}
