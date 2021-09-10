import 'package:flutter/material.dart';
import 'input_page.dart';

class BottomButton extends StatelessWidget {

  final Function onTap;
  final String buttonTitle;

  BottomButton({@required this.buttonTitle, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          buttonTitle,
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),
        ),
        color: bottomContainerColor,
        margin: EdgeInsets.all(15),
        width: double.infinity,
        height: 60,
      ),
    );
  }
}