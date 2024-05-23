import 'package:flutter/material.dart';
import 'package:mobile_app/shared/nxtgame_colors.dart';

abstract class NxtGameButton extends StatelessWidget {
  final String text;
  final Color background;
  final Color textColor;
  final VoidCallback onPressed;
  final Widget? icon;

  const NxtGameButton({super.key,
    required this.text,
    required this.background,
    required this.textColor,
    required this.onPressed,
    this.icon});

  @override
  Widget build(BuildContext context) {
    final style = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(background),
      foregroundColor: MaterialStateProperty.all<Color>(textColor),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      padding: MaterialStateProperty.all<EdgeInsets>(
          const EdgeInsets.symmetric(vertical: 12.0, horizontal: 34.0)),
    );

    if (icon == null) {
      return TextButton(onPressed: onPressed, style: style, child: Text(text));
    } else {
      return ElevatedButton.icon(
          icon: icon!, onPressed: onPressed, style: style, label: Text(text));
    }
  }
}

class NxtGamePrimaryButton extends NxtGameButton {
  const NxtGamePrimaryButton(
      {super.key,
      required String text,
      required VoidCallback onPressed,
      Widget? icon})
      : super(
            text: text,
            background: NxtGameColors.primary,
            textColor: NxtGameColors.white,
            onPressed: onPressed,
            icon: icon);
}
