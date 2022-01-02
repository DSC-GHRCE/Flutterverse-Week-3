import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Button extends StatelessWidget {
  final String icon;
  final Function onTap;
  const Button({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: const Color(0xff000E28),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Center(
          child: Icon(
            icon == "plus" ? FontAwesomeIcons.plus : FontAwesomeIcons.minus,
            color: Colors.white,
            size: 25,
          ),
        ),
      ),
    );
  }
}
