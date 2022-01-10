import 'package:bmicalculator/Screens/ReportPage/ReportPage.dart';
import 'package:flutter/material.dart';

class BMISummary extends StatelessWidget {
  const BMISummary({
    Key? key,
    required this.screenSize,
    required this.widget,
    required this.scoreString,
    required this.scoreStringColor,
  }) : super(key: key);

  final Size screenSize;
  final ReportPage widget;
  final String scoreString;
  final Color scoreStringColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * 0.2,
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 7,
              child: FittedBox(
                fit: BoxFit.fitHeight,
                child: Text(
                  widget.currentInstance.bmiValue.toStringAsFixed(2),
                  style: TextStyle(
                    color: Colors.blueGrey.shade800,
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 2 ,
                child: Padding(
                  padding: const EdgeInsets.all(4),
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: Text(
                      scoreString,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: scoreStringColor,
                      ),
                    ),
                  ),
                )
            )
          ]
      ),
    );
  }
}