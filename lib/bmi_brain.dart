import 'dart:math';

class BmiBrain {
  BmiBrain({required this.weight, required this.height});

  final int height;
  final int weight;
  late double _bmi;

  String calculateBmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getBmiResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi >= 18) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getSuggestions() {
    if (_bmi >= 25) {
      return "You need to exercise more";
    } else if (_bmi >= 18) {
      return "You are doing well, keep up!";
    } else {
      return "Lucky, you get to eat even more!";
    }
  }
}
