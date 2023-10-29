import 'package:bloc_test/model/color_description.dart';
import 'package:flutter/material.dart';

class ColorItemDescriptionScreen extends StatelessWidget {
  const ColorItemDescriptionScreen({super.key, required this.item});

  final ColorDescription item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Color description",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.title!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 300,
              width: double.infinity,
              color: item.color,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(item.description!,  style: Theme.of(context).textTheme.titleMedium,softWrap: true),
          ],
        ),
      ),
    );
  }
}
