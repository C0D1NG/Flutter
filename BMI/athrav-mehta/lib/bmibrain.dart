import 'dart:math';

class BmiBrain {
  BmiBrain({this.height, this.weight});

  final int? height;
  final int? weight;
  double? _bmi;

  String calculation() {
    _bmi = weight! / pow(height! / 100, 2);
    return _bmi!.toStringAsFixed(1);
  }

  String result() {
    if (_bmi! >= 25) {
      return 'overweight';
    } else if (_bmi! >= 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String resultAdvice() {
    if (_bmi! >= 25) {
      return 'You have a higher than normal body weight . Try to exercise more .';
    } else if (_bmi! >= 18.5) {
      return 'You have a Normal body weight . Good job!';
    } else {
      return 'You have a lower than normal body weight . Try to eat more .';
    }
  }
}
