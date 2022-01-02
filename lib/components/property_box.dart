import 'package:flutter/material.dart';
import 'button.dart';

class PropetyBox extends StatelessWidget {
  final String property;
  final int value;
  final Function addOne;
  final Function subtractOne;
  const PropetyBox({
    Key? key,
    required this.property,
    required this.value,
    required this.addOne,
    required this.subtractOne,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xff091534),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              property,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value.toString(),
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Button(
                  icon: "minus",
                  onTap: () {
                    subtractOne();
                  },
                ),
                Button(
                  icon: "plus",
                  onTap: () {
                    addOne();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
