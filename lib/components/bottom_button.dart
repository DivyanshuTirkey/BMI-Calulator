import 'package:flutter/material.dart';
import '../constants.dart';


class BottomButton extends StatelessWidget {

  BottomButton({@required this.label,@required this.onTapped});

  final String label;
  final Function onTapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapped,
      child: Container(
        alignment: Alignment.center,
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 7.0),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Text(
          label,
          style: kNumTextStyle.copyWith(
            fontSize: 30.0,

          ),
        ),
      ),
    );
  }
}