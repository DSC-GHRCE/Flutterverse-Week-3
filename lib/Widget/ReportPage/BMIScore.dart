import 'package:flutter/material.dart';

class BMIScore extends StatelessWidget {
  const BMIScore({
    Key? key,
    required this.screenSize,
    required this.multiplier,
  }) : super(key: key);

  final Size screenSize;
  final double multiplier;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      height: screenSize.height * 0.125,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 3,
                      child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Image.asset('assets/bmi.png')
                      )
                  ),
                  Expanded(
                    flex: 1,
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: Text(
                        'Score',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey.shade700
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                              colors: [
                                Colors.amber.shade200,
                                Colors.amber.shade400,
                                Colors.pink.shade200,
                                Colors.pink.shade300,
                                Colors.red.shade400,
                                Colors.red.shade500,
                              ],
                              stops: const [0.1,0.25,0.45,0.6,0.75,0.9]
                          )
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 20),
                    child: AnimatedContainer(
                      duration: const Duration(
                          milliseconds: 700
                      ),
                      curve: Curves.decelerate,
                      width: (screenSize.width * 0.53) * multiplier,
                      decoration: const BoxDecoration(
                        border: Border(
                          right: BorderSide(width: 4, color: Colors.blueGrey),
                        ),
                      ),
                    ),
                  )
                ]
            ),
          ),
        ],
      ),
    );
  }
}