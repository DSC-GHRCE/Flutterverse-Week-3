import 'package:flutter/material.dart';

class ScalesScroller extends StatelessWidget {
  const ScalesScroller({
    Key? key,
    required FixedExtentScrollController controller,
  }) : _controller = controller, super(key: key);

  final FixedExtentScrollController _controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            )
        ),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 5),
              width: 15,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ShaderMask(
                  shaderCallback: (Rect rect) {
                    return LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.grey.shade200, Colors.transparent, Colors.transparent, Colors.grey.shade200],
                      stops: const [0.0, 0.3, 0.7, 1.0],
                    ).createShader(rect);
                  },
                  blendMode: BlendMode.dstOut,
                  child: ListWheelScrollView.useDelegate(
                    controller: _controller,
                    itemExtent: 50,
                    perspective: 0.001,
                    diameterRatio: 1.5,
                    physics: const FixedExtentScrollPhysics(parent: BouncingScrollPhysics()),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 201,
                      builder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Center(
                            child: Text(
                              index.toString(),
                              style: TextStyle(
                                fontSize: 34,
                                color: Colors.grey.shade700,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              width: 15,
              height: 5,
              decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10)
              ),
            ),
          ],
        ),
      ),
    );
  }
}