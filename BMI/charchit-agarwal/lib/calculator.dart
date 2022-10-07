import 'dart:math';

class Calculate {
  final int weight;
  final int height;
  double? _bmi;
  Calculate({required this.height, required this.weight});

  String BMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String result() {
    if (_bmi! > 25) {
      return 'Overweight';
    } else if (_bmi! > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String tip() {
    if (_bmi! > 25) {
      return 'Your bmi is more than usual. Exercise more';
    } else if (_bmi! > 18.5) {
      return 'You are fit';
    } else {
      return 'Your bmi is less than usual. Eat more';
    }
  }
}
