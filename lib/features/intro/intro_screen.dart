import 'package:flutter/material.dart';
import 'package:mobile_app/features/intro/widgets/intro_bottom_bar.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Création d'équipe personnalisée"),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: IntroBottomBar()));
  }
}
