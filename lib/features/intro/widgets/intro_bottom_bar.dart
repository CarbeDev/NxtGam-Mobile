import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/shared/nxtgame_colors.dart';
import 'package:mobile_app/shared/widgets/buttons/nxtgam_buttons.dart';

class IntroBottomBar extends StatelessWidget {
  final VoidCallback onPass;
  final VoidCallback onNext;

  const IntroBottomBar({required this.onPass, required this.onNext, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        InkWell(
          onTap: onPass,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 34.0),
            child: Text(
              "Skip".tr(),
              style: const TextStyle(color: NxtGameColors.primary),
            ),
          ),
        ),
        NxtGamPrimaryButton(text: "Next".tr(), onPressed: onNext),
      ],
    );
  }
}
