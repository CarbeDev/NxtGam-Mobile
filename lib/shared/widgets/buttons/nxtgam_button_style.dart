import 'package:flutter/material.dart';

class NxtGamButtonStyle extends ButtonStyle {
  final Color textColor;
  final Color background;

  NxtGamButtonStyle(this.textColor, this.background)
      : super(
          backgroundColor: MaterialStateProperty.all<Color>(background),
          foregroundColor: MaterialStateProperty.all<Color>(textColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 12.0, horizontal: 34.0),
          ),
        );
}
