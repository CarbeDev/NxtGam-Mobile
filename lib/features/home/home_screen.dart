import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/features/home/home_cubit.dart';
import 'package:mobile_app/shared/nxtgame_colors.dart';
import 'package:mobile_app/shared/widgets/nxtgam_texts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: NxtGamTitle(state.username),
                actions: [
                  IconButton(
                      icon: const Icon(
                        Icons.add,
                        color: NxtGameColors.primary,
                      ),
                      onPressed: () {
                        print("add league");
                      }),
                  IconButton(
                      icon: const Icon(
                        Icons.settings,
                        color: NxtGameColors.grey,
                      ),
                      onPressed: () {
                        print("Settings");
                      })
                ],
              ),
              body: const Center(
                child: NxtGamDescription("Aucune League N'as ete rejointe"),
              ),
            );
          },
        ));
  }
}
