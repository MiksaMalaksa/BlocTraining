import 'package:bloc_test/widgets/app_bars/welcome_screen_app_bar.dart';
import 'package:bloc_test/widgets/blocs/list_of_descriptions/bloc.dart';
import 'package:bloc_test/widgets/color_descriptions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WelcomeScreeenAppBar(),
      body: BlocBuilder<ColorDescriptionsBloc, ColorDescriptionsState>(
          builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ColorDescreptions(list: state.colorDescretions));
      }),
    );
  }
}
