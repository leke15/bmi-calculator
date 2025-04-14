import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reuseable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bmi_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender genderSelected = Gender.female;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Resuable_card(
                    colour: genderSelected == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: genderSelector(
                      icon: FontAwesomeIcons.mars,
                      contentString: "Male",
                    ),
                    onPress: () {
                      setState(() {
                        genderSelected = Gender.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Resuable_card(
                    colour: genderSelected == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: genderSelector(
                      icon: FontAwesomeIcons.venus,
                      contentString: "Female",
                    ),
                    onPress: () {
                      setState(() {
                        genderSelected = Gender.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Resuable_card(
              colour: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Height",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120,
                      max: 250,
                      activeColor: kBottomButtonColor,
                      inactiveColor: kInactiveCardColor,
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Resuable_card(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Weight",
                          style: kLabelTextStyle,
                        ),
                        Row(
                          textBaseline: TextBaseline.alphabetic,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          children: [
                            Text(
                              weight.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              "Kg",
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              buttonIcon: FontAwesomeIcons.minus,
                              buttonColor: kBottomButtonColor,
                              buttonFunctionality: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              buttonIcon: FontAwesomeIcons.plus,
                              buttonColor: kBottomButtonColor,
                              buttonFunctionality: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Resuable_card(
                    colour: Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Age",
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              buttonIcon: FontAwesomeIcons.minus,
                              buttonColor: kBottomButtonColor,
                              buttonFunctionality: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            RoundIconButton(
                              buttonIcon: FontAwesomeIcons.plus,
                              buttonColor: kBottomButtonColor,
                              buttonFunctionality: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BmiBrain calc = BmiBrain(weight: weight, height: height);
              calc.calculateBmi();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmiCategory: calc.getBmiResult(),
                      bmiResult: calc.calculateBmi(),
                      bmiSuggestion: calc.getSuggestions(),
                    );
                  },
                ),
              );
            },
            child: Container(
              child: Center(
                child: Text(
                  "CALCULATE",
                  style: kLargeTextStyle,
                ),
              ),
              width: double.infinity,
              margin: EdgeInsets.only(top: 10),
              color: kBottomButtonColor,
              height: kBottomButtonHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({
    required this.buttonIcon,
    this.buttonColor,
    required this.buttonFunctionality,
  });
  final IconData buttonIcon;
  final Color? buttonColor;
  final Function buttonFunctionality;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: () {
        buttonFunctionality();
      },
      child: Icon(buttonIcon),
      shape: CircleBorder(),
      fillColor: buttonColor,
      constraints: BoxConstraints.tightFor(
        width: 50,
        height: 60,
      ),
    );
  }
}
