import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'constants.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: kInactiveCardColor,
        ),
        scaffoldBackgroundColor: Color(0xff0E0F21),
      ),
      home: InputPage(),
    );
  }
}

