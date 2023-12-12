import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rool_dice_project/dice_roller.dart';
import 'package:rool_dice_project/styled_text.dart';

//kod derlendiğinde kilitlenir, bellekte yeri tutulur.
const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  GradientContainer({super.key, required this.colors});

  GradientContainer.purple() : this(colors: [Colors.purple, Colors.white]);

  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: Center(
        child: DiceRoller(),
      ),
    );
  }
}
