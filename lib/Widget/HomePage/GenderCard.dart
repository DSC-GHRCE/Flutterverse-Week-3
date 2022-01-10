import 'package:flutter/material.dart';

class GenderCard extends StatefulWidget {
  const GenderCard({
    Key? key,
    required this.gender,
    required this.currentSelectedGender,
    required this.changeGender,
    required this.isSelected
  }) : super(key: key);

  final int gender;
  final int currentSelectedGender;
  final bool isSelected;
  final Function changeGender;

  @override
  State<GenderCard> createState() => _GenderCardState();
}

class _GenderCardState extends State<GenderCard> {
  @override
  Widget build(BuildContext context) {
    Size sizeOfScreen = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.changeGender(widget.gender);
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        margin: widget.isSelected ? const EdgeInsets.all(0): const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: widget.gender == 0 ? const Color(0xff243754) : Colors.yellow.shade900,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(0, 0, 0, 0.5),
                offset: widget.isSelected ? const Offset(0, 15) : const Offset(0,0),
                blurRadius: widget.isSelected ? 10 : 0,
                spreadRadius: 0,
              )
            ]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              widget.gender == 0 ? Icons.male_rounded :
              widget.gender == 1 ? Icons.female_rounded :
              Icons.person,
              size:75,
              color: Colors.white,
            ),
            const Divider(color: Colors.white,thickness: 1,),
            Text(
              widget.gender == 0 ? 'Male' :
              widget.gender == 1 ? 'Female' :
              'Unknown',
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),
            )
          ],
        ),
      ),
    );
  }
}