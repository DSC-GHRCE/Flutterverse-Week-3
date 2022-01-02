import 'dart:math';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String gender;
  final int height;
  final int weight;
  final int age;

  String calculateBMI() {
    return (weight / pow(height / 100, 2)).toString().substring(0, 5);
  }

  const ResultPage({
    Key? key,
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  }) : super(key: key);

  static TextStyle myStyle = const TextStyle(
    color: Colors.white,
    fontSize: 30,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff000E28),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w900,
            letterSpacing: 0.6,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(18),
        color: const Color(0xff000E28),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Gender", style: myStyle),
                      const SizedBox(width: 5),
                      Text(":", style: myStyle),
                      const SizedBox(width: 5),
                      Text(gender, style: myStyle),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Height", style: myStyle),
                      const SizedBox(width: 5),
                      Text(":", style: myStyle),
                      const SizedBox(width: 5),
                      Text(height.toString(), style: myStyle),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Weight", style: myStyle),
                      const SizedBox(width: 5),
                      Text(":", style: myStyle),
                      const SizedBox(width: 5),
                      Text(weight.toString(), style: myStyle),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Age", style: myStyle),
                      const SizedBox(width: 5),
                      Text(":", style: myStyle),
                      const SizedBox(width: 5),
                      Text(age.toString(), style: myStyle),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Gender", style: myStyle),
                      const SizedBox(width: 5),
                      Text(":", style: myStyle),
                      const SizedBox(width: 5),
                      Text(gender, style: myStyle),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Divider(
                    color: Colors.white,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("BMI", style: myStyle),
                      const SizedBox(width: 5),
                      Text(":", style: myStyle),
                      const SizedBox(width: 5),
                      Text(calculateBMI(), style: myStyle),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
