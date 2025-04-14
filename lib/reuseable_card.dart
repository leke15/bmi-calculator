import 'package:flutter/material.dart';

class Resuable_card extends StatelessWidget {
  Resuable_card({required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
            color: colour, borderRadius: BorderRadius.circular(15)),
        margin: EdgeInsets.all(15),
      ),
    );
  }
}
