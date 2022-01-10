import 'package:flutter/material.dart';

class GenderBox extends StatelessWidget {
  final String gender;
  final String selectedGender;
  final Function onTap;
  const GenderBox({
    Key? key,
    required this.gender,
    required this.selectedGender,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff091534),
            border: Border.all(
              width: selectedGender == gender ? 2 : 0,
              color:
                  selectedGender == gender ? Colors.white : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                gender == 'Male' ? Icons.male : Icons.female,
                color: Colors.white,
                size: 100,
              ),
              const SizedBox(height: 10),
              Text(
                gender,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
