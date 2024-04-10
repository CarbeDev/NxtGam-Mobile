import 'package:flutter/material.dart';
import 'package:mobile_app/features/intro/intro_screen.dart';
import 'package:supertokens_flutter/supertokens.dart';


void main() {
  SuperTokens.init(apiDomain: "http://localhost:8080", apiBasePath: "/auth");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NxtGam',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        fontFamily: 'Lexend',
        useMaterial3: true,
      ),
      home: const IntroScreen(),
    );
  }
}