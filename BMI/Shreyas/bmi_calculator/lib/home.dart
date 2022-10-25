import 'package:bmi_calculator/helper.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  double bmi = double.infinity;
  String bmiStatus = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI calculator'),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your height';
                    }
                    try {
                      final num = double.parse(value);
                      if (num <= 0) {
                        return 'Please valid Height';
                      }
                    } catch (e) {
                      return 'Please enter valid Height';
                    }
                  },
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Height",
                    suffixText: "CM",
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your weight";
                    }
                    try {
                      final num = double.parse(value);
                      if (num <= 0) return "Please enter your weight";
                    } catch (e) {
                      return "Please enter a valid number";
                    }
                  },
                  keyboardType: TextInputType.number,
                  controller: _weightController,
                  decoration: const InputDecoration(
                    labelText: "Weight",
                    suffixText: "KG",
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    final double height = double.parse(_heightController.text);
                    final double weight = double.parse(_weightController.text);
                    setState(() {
                      bmi = BMI.calculateMyBMI(weight, height);
                      bmiStatus = BMI.whatIsMyBMI(bmi);
                    });
                  }
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue),
                  child: const Text('BMI'),
                ),
              ),
              if (bmi != double.infinity)
                Container(
                  height: 50,
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber),
                  child: Text('$bmi'),
                ),
              if (bmi != double.infinity)
                Container(
                  height: 50,
                  margin: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber),
                  child: Text(bmiStatus),
                )
            ],
          ),
        ),
      ),
    );
  }
}
