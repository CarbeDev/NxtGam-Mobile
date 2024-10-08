import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/features/intro/intro_screen.dart';
import 'package:mobile_app/features/new_account/new_account_cubit.dart';
import 'package:mobile_app/shared/nxtgame_colors.dart';

import 'features/intro/intro_cubit.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(EasyLocalization(
    supportedLocales: const [Locale('en', 'US'), Locale('fr', 'FR')],
    path: "assets/translations",
    fallbackLocale: const Locale('en', 'US'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<IntroCubit>(create: (_) => IntroCubit()),
          BlocProvider<NewAccountCubit>(create: (_) => NewAccountCubit())
        ],
        child: MaterialApp(
          title: 'NxtGam',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: NxtGamColors.primary),
            fontFamily: 'Lexend',
            useMaterial3: true,
          ),
          home: const IntroScreen(),
        ));
  }
}
