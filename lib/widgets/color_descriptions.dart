import 'package:bloc_test/model/color_description.dart';
import 'package:bloc_test/widgets/color_description_item.dart';
import 'package:flutter/material.dart';

class ColorDescreptions extends StatelessWidget {
  const ColorDescreptions({super.key,required this.list});

  final List<ColorDescription> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ColorDescriptionItem(
              colorItem: list[index],
              onSelected: (context, colorItem) {});
        });
  }
}

