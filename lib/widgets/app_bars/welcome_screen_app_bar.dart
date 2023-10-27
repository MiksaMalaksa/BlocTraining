import 'package:bloc_test/themes/app_them_bloc.dart';
import 'package:bloc_test/screens/add_item.dart';
import 'package:bloc_test/widgets/blocs/list_of_descriptions/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreeenAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const WelcomeScreeenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkTheme =
        context.select((ThemeBloc bloc) => bloc.state.theme) == ThemeMode.dark
            ? true
            : false;
    return AppBar(
      title: Text(
        "Welcome to bloc example",
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
      actions: [
        Switch(
            activeColor: Colors.white,
            value: isDarkTheme,
            onChanged: (value) {
              return value == false
                  ? context.read<ThemeBloc>().add(LightThemeEvent())
                  : context.read<ThemeBloc>().add(DarkThemeEvent());
            }),
        IconButton(
            onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => BlocProvider.value(
                    value: BlocProvider.of<ColorDescriptionsBloc>(context),
                    child: const AddColorDescriptionItem()))),
            icon: const Icon(Icons.add))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
