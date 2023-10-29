import 'package:flutter/material.dart';
import '../model/color_description.dart';

class ColorDescriptionItem extends StatelessWidget {
  const ColorDescriptionItem(
      {super.key, required this.colorItem, required this.onSelected});

  final ColorDescription colorItem;
  final void Function(BuildContext context, ColorDescription colorDescription)
      onSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onSelected,
      title: colorItem.title == "" || colorItem.title == null
          ? const Text("No title")
          : Text(
              "${colorItem.title!.substring(0, colorItem.title!.length < 15 ? colorItem.title!.length : 15)}${colorItem.title!.length > 15 ? "..." : ""}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
      leading: colorItem.color == null
          ? Icon(
              Icons.cancel,
              color: Theme.of(context).colorScheme.primary,
            )
          : Icon(Icons.brush, color: colorItem.color),
      subtitle: Text(
        "Tap for more info",
        style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
      ),
    );
  }
}
