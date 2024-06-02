import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/features/new_account/new_account_cubit.dart';
import 'package:mobile_app/shared/nxtgame_colors.dart';
import 'package:mobile_app/shared/widgets/buttons/nxtgam_buttons.dart';
import 'package:mobile_app/shared/widgets/nxtgam_texts.dart';

class NewAccountScreen extends StatelessWidget {
  const NewAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewAccountCubit(),
      child: BlocBuilder<NewAccountCubit, NewAccountState>(
          builder: (BuildContext context, NewAccountState state) {
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).viewPadding.top + 8,
                horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                NxtGameTitle("Welcome".tr()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: "Username".tr(),
                        hintText: "NewAccountPlaceholder".tr(),
                        focusColor: NxtGameColors.primary,
                        focusedBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: NxtGameColors.primary))),
                    onChanged: (value) =>
                        {context.read<NewAccountCubit>().updateUsername(value)},
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: NxtGamPrimaryButton(
                text: "Next".tr(),
                isDisabled: !state.isUsernameValid,
                onPressed: () =>
                    {context.read<NewAccountCubit>().saveUsername()}),
          ),
        );
      }),
    );
  }
}
