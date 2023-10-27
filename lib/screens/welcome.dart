import 'package:bloc_test/widgets/app_bars/welcome_screen_app_bar.dart';
import 'package:bloc_test/widgets/color_descriptions.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: WelcomeScreeenAppBar(),
      body: Padding(padding: EdgeInsets.all(8.0), child: ColorDescreptions()),
    );
  }
}
