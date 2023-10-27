import 'package:bloc_test/model/color_description.dart';
import 'package:bloc_test/widgets/color_description_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/list_of_descriptions/bloc.dart';

class ColorDescreptions extends StatelessWidget {
  const ColorDescreptions({super.key});

  @override
  Widget build(BuildContext context) {
    List<ColorDescription> colorDescretions = context
        .select((ColorDescriptionsBloc bloc) => bloc.state.colorDescretions);
    return ListView.builder(
        itemCount: colorDescretions.length,
        itemBuilder: (context, index) {
          return ColorDescriptionItem(
              colorItem: colorDescretions[index],
              onSelected: (context, colorItem) {});
        });
  }
}
