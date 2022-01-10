import 'package:flutter/material.dart';

class ScalesLabel extends StatelessWidget {
  const ScalesLabel({
    Key? key,
    required this.nameOfScale,
  }) : super(key: key);

  final String nameOfScale;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 5),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.amber.shade700,
            borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: Image.asset(
                  nameOfScale == 'Height' ?
                  'assets/height.png' :
                  'assets/weight.png',
                  color: Colors.grey.shade800,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.only(right: 20,top: 10,bottom: 10),
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          nameOfScale,
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          nameOfScale == 'Height' ? '(cm)' : '(kg)',
                          style: TextStyle(
                              color: Colors.grey.shade800,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}