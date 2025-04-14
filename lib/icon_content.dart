import 'package:flutter/material.dart';
import 'constants.dart';

class genderSelector extends StatelessWidget {
  genderSelector({required this.icon, required this.contentString});
  final IconData icon;
  final String contentString;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 50,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          contentString,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
