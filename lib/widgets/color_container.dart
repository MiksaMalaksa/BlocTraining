import 'package:bloc_test/widgets/blocs/color_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorContainer extends StatefulWidget {
  const ColorContainer(
      {super.key, required this.color, required this.nameOfColor});

  final Color color;
  final String nameOfColor;

  @override
  State<ColorContainer> createState() => _ColorContainerState();
}

class _ColorContainerState extends State<ColorContainer> {
  double bigContainerSize = 96;
  double smallContainerSize = 66;
  double borderWidth = 3;
  bool changeToWhite = false;

  double saveiBgContainerSize = 96;
  double saveSmallContainerSize = 66;
  double saveBorderWidth = 3;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.easeOut,
      height: bigContainerSize,
      width: bigContainerSize,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
              width: borderWidth,
              color: changeToWhite
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary)),
      child: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              bool choosed = context.read<ColorAnimationBloc>().state.choosed;
              if (smallContainerSize != bigContainerSize && !choosed) {
                smallContainerSize = bigContainerSize;
                borderWidth = 0;
                changeToWhite = true;
                context.read<ColorAnimationBloc>().add(
                    ColorAnimationToggledEvent(toogledColor: widget.color));
              } else if (smallContainerSize == bigContainerSize && choosed) {
                smallContainerSize = saveSmallContainerSize;
                borderWidth = saveBorderWidth;
                changeToWhite = false;
                context
                    .read<ColorAnimationBloc>()
                    .add(ColorAnimationUntoggledEvent());
              } else {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 1),
                  content: const Text(
                    "Can not choose 2 colors at once!",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                ));
                bigContainerSize == smallContainerSize;
              }
            });
          },
          child: AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            width: smallContainerSize,
            height: smallContainerSize,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(
                    width: 2, color: Theme.of(context).colorScheme.primary),
                color: widget.color),
            child: Center(
                child: Text(
              widget.nameOfColor,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.white),
            )),
          ),
        ),
      ),
    );
  }
}
