import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/gender_box.dart';
import 'package:bmi_calculator/components/property_box.dart';
import 'result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int weight = 56;
  int age = 21;
  int height = 150;

  String selectedGender = "Male";
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GenderBox(
                    gender: "Male",
                    selectedGender: selectedGender,
                    onTap: () {
                      setState(() {
                        selectedGender = "Male";
                      });
                    },
                  ),
                  const SizedBox(width: 32),
                  GenderBox(
                    gender: "Female",
                    selectedGender: selectedGender,
                    onTap: () {
                      setState(() {
                        selectedGender = "Female";
                      });
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xff091534),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        "Height",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (newHeight) {
                          setState(() {
                            height = newHeight.toInt();
                          });
                        },
                      ),
                      Text(
                        height.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PropetyBox(
                    property: "Weight",
                    value: weight,
                    addOne: () {
                      setState(() {
                        weight++;
                      });
                    },
                    subtractOne: () {
                      setState(() {
                        weight--;
                      });
                    },
                  ),
                  const SizedBox(width: 32),
                  PropetyBox(
                    property: "Age",
                    value: age,
                    addOne: () {
                      setState(() {
                        age++;
                      });
                    },
                    subtractOne: () {
                      setState(() {
                        age--;
                      });
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color(0xff000E28),
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ResultPage(
                    gender: selectedGender,
                    height: height,
                    weight: weight,
                    age: age,
                  );
                },
              ),
            );
          },
          child: Container(
            height: 60,
            decoration: const BoxDecoration(
              color: Color(0xff091534),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: const Center(
              child: Text(
                "Calculate BMI",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
