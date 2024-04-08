import 'package:flutter/material.dart';
import 'package:mobile_app/features/intro/widgets/intro_bottom_bar.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: IntroBottomBar(),
    );
  }
}
