import 'package:flutter/material.dart';

import 'ScalesLabel.dart';
import 'ScalesScroller.dart';

class MetricScale extends StatelessWidget {
  const MetricScale({
    Key? key,
    required this.nameOfScale,
    required FixedExtentScrollController controllerForHeight,
  }) : _controller = controllerForHeight, super(key: key);
  final String nameOfScale;
  final FixedExtentScrollController _controller;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      width: screenSize.width * 0.4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        children: [
          ScalesLabel(nameOfScale: nameOfScale),
          ScalesScroller(controller: _controller),
        ],
      ),
    );
  }
}



