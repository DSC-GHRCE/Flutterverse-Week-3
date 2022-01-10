import 'dart:async';

import '../../Helper/bmiInstance.dart';
import '../../Widget/ReportPage/BMIScore.dart';
import '../../Widget/ReportPage/BMISummary.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key,required this.currentInstance}) : super(key: key);
  final BMI currentInstance;

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  late double multiplier;
  String scoreString = '';
  var scoreStringColor = Colors.transparent;
  void changeMultiplier() {
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        multiplier = widget.currentInstance.bmiValue / 40;
      });
    });
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    multiplier = 0;
    changeMultiplier();
    if(widget.currentInstance.bmiValue <= 18.5){
      scoreString = 'You are Underweight!';
      scoreStringColor = Colors.amberAccent;
    }else if(widget.currentInstance.bmiValue > 18.5 && widget.currentInstance.bmiValue <= 24.9){
      scoreString = 'You have Normal Weight!';
      scoreStringColor = Colors.pink.shade300;
    }else if(widget.currentInstance.bmiValue >= 25 && widget.currentInstance.bmiValue <= 29.9){
      scoreString = 'You are Overweight!';
      scoreStringColor = Colors.red.shade300;
    }else{
      scoreString = 'You are Obese!';
      scoreStringColor = Colors.red.shade800;
    }
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            iconTheme: IconTheme.of(context).copyWith(color: Colors.black),
            pinned: true,
            elevation: 0,
            backgroundColor: Colors.grey[300],
            title: Row(
              children: const [
                Text(
                  'Your',
                  style: TextStyle(
                      letterSpacing: 1.1,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 24
                  ),
                ),
                Text(
                  ' Summary',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 24
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: BMIScore(screenSize: screenSize, multiplier: multiplier),
          ),
          SliverToBoxAdapter(
            child: BMISummary(
                screenSize: screenSize,
                widget: widget,
                scoreString: scoreString,
                scoreStringColor: scoreStringColor
            ),
          )
        ],
      ),
    );
  }
}


