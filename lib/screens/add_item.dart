import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/color_description.dart';
import '../widgets/blocs/list_of_descriptions/bloc.dart';

class AddColorDescriptionItem extends StatelessWidget {
  const AddColorDescriptionItem({super.key});

  void _dummyAdd(BuildContext context) {
    context.read<ColorDescriptionsBloc>().add(
          ColorDescriptionsAddEvent(
            addingElement: ColorDescription(
              color: Colors.amber,
              description: "s",
              title: "Oj",
              id: uuid.v4()
            ),
          ),
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("Add screen"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Dummy add check"),
          onPressed: () => _dummyAdd(context),
        ),
      ),
    );
  }
}

// !-_-_- [get it, di] -_-_-!