import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
import 'reuseable_card.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.bmiCategory,
      required this.bmiResult,
      required this.bmiSuggestion});

  final String bmiCategory;
  final String bmiResult;
  final String bmiSuggestion;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI CALCULATOR"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              child: Text(
                "Your Results",
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              child: Resuable_card(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      bmiCategory,
                      style: kBmiCategory,
                    ),
                    Text(
                      bmiResult,
                      style: kBmiNumber,
                    ),
                    Text(
                      bmiSuggestion,
                      style: kBmiInterpretation,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                child: Text(
                  "RE-CALCULATE",
                  style: kLargeTextStyle,
                ),
              ),
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              color: kBottomButtonColor,
              height: kBottomButtonHeight,
            ),
          )
        ],
      ),
    );
  }
}
