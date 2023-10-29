import 'package:bloc_test/model/color_description.dart';
import 'package:bloc_test/widgets/blocs/list_of_descriptions/bloc.dart';
import 'package:bloc_test/widgets/color_description_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorDescreptions extends StatelessWidget {
  const ColorDescreptions({super.key, required this.list});
  final List<ColorDescription> list;

  void _deletingElement(BuildContext context, int index) {
    final saveElement = list[index];
    context
        .read<ColorDescriptionsBloc>()
        .add(ColorDescriptionsRemoveEvent(removeElement: list[index]));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(seconds: 2),
      backgroundColor: Theme.of(context).colorScheme.primary,
      content: const Text(
        "Undo action?",
        style: TextStyle(color: Colors.white),
      ),
      action: SnackBarAction(
          label: "cancel",
          textColor: Colors.blueAccent.shade100,
          onPressed: () {
            context.read<ColorDescriptionsBloc>().add(
                ColorDescreptionsCanceledDeletingEvent(
                    returnedElement: saveElement, index: index));
          }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(list[index]),
            onDismissed: (direction) => _deletingElement(context, index),
            child: ColorDescriptionItem(
                colorItem: list[index], onSelected: (context, colorItem) {}),
          );
        });
  }
}
