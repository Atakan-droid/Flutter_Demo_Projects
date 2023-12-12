import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rool_dice_project/styled_text.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({Key? key}) : super(key: key);

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 1;

  void rollDice() {
    int randomNumber = randomizer.nextInt(6) + 1;
    setState(() {
      currentDiceRoll = randomNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StyledText('Hello World!'),
        SizedBox(height: 20),
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          fit: BoxFit.contain,
          width: 200,
        ),
        SizedBox(height: 20),
        TextButton(
            onPressed: rollDice,
            child: Text('Roll Dice'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 20),
              backgroundColor: Colors.black.withOpacity(0.3),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            )),
      ],
    );
  }
}
