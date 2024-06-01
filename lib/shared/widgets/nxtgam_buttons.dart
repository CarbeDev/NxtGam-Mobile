import 'package:flutter/material.dart';
import 'package:mobile_app/shared/nxtgame_colors.dart';

abstract class NxtGameButton extends StatelessWidget {
  final String text;
  final Color background;
  final Color textColor;
  final VoidCallback onPressed;
  final Widget? icon;
  final bool isDisabled;

  const NxtGameButton({super.key,
    required this.text,
    required this.background,
    required this.textColor,
    required this.onPressed,
      this.isDisabled = false,
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

    final onPressedOrNullIfDisabled = isDisabled ? null : onPressed;
    if (icon == null) {
      return TextButton(
          onPressed: onPressedOrNullIfDisabled,
          style: style,
          child: Text(text));
    } else {
      return ElevatedButton.icon(
          icon: icon!,
          onPressed: onPressedOrNullIfDisabled,
          style: style,
          label: Text(text));
    }
  }
}

class NxtGamPrimaryButton extends NxtGameButton {
  const NxtGamPrimaryButton(
      {super.key,
      required super.text,
      required super.onPressed,
      super.icon,
      super.isDisabled})
      : super(
            background: NxtGameColors.primary, textColor: NxtGameColors.white);
}
