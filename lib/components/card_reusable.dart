import 'package:flutter/material.dart';
import '../constants.dart';


class CardReusable extends StatelessWidget {

  CardReusable({@required this.colour, this.cardChild , this.onPress});

  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(kEdgeInsets),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kBorderRadius),
          color: colour,
        ),
      ),
    );
  }
}

