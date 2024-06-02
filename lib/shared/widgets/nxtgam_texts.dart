import 'package:flutter/material.dart';
import 'package:mobile_app/shared/nxtgame_colors.dart';

class NxtGameTitle extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const NxtGameTitle(this.text, {this.textAlign, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign ?? TextAlign.left,
      style: const TextStyle(fontSize: 24),
    );
  }
}

class NxtGameDescription extends StatelessWidget {
  final String text;

  const NxtGameDescription(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(color: NxtGameColors.grey),
    );
  }
}
