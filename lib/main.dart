import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/features/intro/intro_screen.dart';
import 'package:supertokens_flutter/supertokens.dart';

Future<void> main() async {
  SuperTokens.init(apiDomain: "http://localhost:8080", apiBasePath: "/auth");

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

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
    return MaterialApp(
      title: 'NxtGam',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        fontFamily: 'Lexend',
        useMaterial3: true,
      ),
      home: IntroScreen(),
    );
  }
}