class BMI {
  static double calculateMyBMI(double weight, double height) {
    height /= 100;
    double bmi = weight / height;
    return bmi;
  }

  static String whatIsMyBMI(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi >= 18.5 && bmi < 25) {
      return 'Normal';
    } else if (bmi >= 25 && bmi < 30) {
      return 'Overweight';
    } else {
      return 'Obese';
    }
  }
}
