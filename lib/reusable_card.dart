import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  final Color color;
  final Widget cardChild;
  final Function function;

  ReusableCard({@required this.color, this.cardChild, this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
