import 'package:flutter/material.dart';

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
  bool choosed = false;

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
              if (choosed = true && smallContainerSize == bigContainerSize) {
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    duration: Duration(seconds: 1),
                    content: Text("Can not choose 2 colors at once!")));
                bigContainerSize == smallContainerSize;
              } else if (smallContainerSize != bigContainerSize) {
                smallContainerSize = bigContainerSize;
                borderWidth = 0;
                changeToWhite = true;
                choosed = true;
              } else {
                smallContainerSize = saveSmallContainerSize;
                borderWidth = saveBorderWidth;
                changeToWhite = false;
                choosed = false;
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
