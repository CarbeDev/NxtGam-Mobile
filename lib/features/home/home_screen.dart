import 'package:easy_localization/easy_localization.dart';
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
              body: Center(
                child: NxtGamDescription("NoLeagueInProgress".tr()),
              ),
              bottomNavigationBar: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.home), label: "Home".tr()),
                  BottomNavigationBarItem(
                      icon: const Icon(Icons.notifications),
                      label: "Notifications".tr())
                ],
                selectedItemColor: NxtGameColors.primary,
                onTap: context.read<HomeCubit>().changeView,
                currentIndex: state.bottomBarIndex,
              ),
            );
          },
        ));
  }
}
