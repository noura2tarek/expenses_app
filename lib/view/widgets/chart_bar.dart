import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  const ChartBar({Key? key, required this.fill}) : super(key: key);
  final double fill;

  @override
  Widget build(BuildContext context) {
    // to get the brightness of the application
    final bool isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: FractionallySizedBox(
          heightFactor: fill,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(10),
              ),
              color: isDarkMode
                  ? Theme.of(context).colorScheme.primaryContainer // secondary
                  : Theme.of(context).colorScheme.primary.withOpacity(0.7),
            ),
          ),
        ),
      ),
    );
  }
}
