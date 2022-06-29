import 'package:flutter/material.dart';
import '../constants.dart';



class IconContent extends StatelessWidget {

  IconContent({@required this.icon, @required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[

        Expanded(
          flex: 7,
          child: Icon(
            icon,
            size: kIconSize,
            color: kCardContentColor,
          ),
        ),
        Expanded(
          flex: 2,
          child: Text(text, style: kTextStyle,),
        )
      ],
    );
  }
}