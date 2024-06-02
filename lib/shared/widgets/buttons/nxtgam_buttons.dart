import 'package:flutter/material.dart';
import 'package:mobile_app/shared/nxtgame_colors.dart';
import 'package:mobile_app/shared/widgets/buttons/nxtgam_button_style.dart';

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
    final style = isDisabled
        ? NxtGamButtonStyle(NxtGameColors.grey, NxtGameColors.lightGrey)
        : NxtGamButtonStyle(textColor, background);

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
