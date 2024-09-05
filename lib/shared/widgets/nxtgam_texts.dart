import 'package:flutter/material.dart';
import 'package:mobile_app/shared/nxtgame_colors.dart';

class NxtGamTitle extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const NxtGamTitle(this.text, {this.textAlign, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: const TextStyle(fontSize: 24),
    );
  }
}

class NxtGamDescription extends StatelessWidget {
  final String text;

  const NxtGamDescription(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: NxtGamColors.grey),
    );
  }
}
