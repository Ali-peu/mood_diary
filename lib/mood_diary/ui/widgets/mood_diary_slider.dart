import 'package:flutter/material.dart';

class SliderWithDividers extends StatefulWidget {
  @override
  _SliderWithDividersState createState() => _SliderWithDividersState();
}

class _SliderWithDividersState extends State<SliderWithDividers> {
  double _sliderValue = 0.0;
  final int divisions = 6; // Number of divisions

  @override
  Widget build(BuildContext context) {
    return FormBuilderSlider();
    // return Stack(
    //   alignment: Alignment.center,
    //   children: [
    //     Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: [
    //         Slider(
    //           value: _sliderValue,
    //           min: 0.0,
    //           max: 100.0,
    //           divisions: divisions,
    //           onChanged: (value) {
    //             setState(() {
    //               _sliderValue = value;
    //             });
    //           },
    //         ),
    //       ],
    //     ),
    //     // Overlay dividers based on the number of divisions
    //     ...List.generate(divisions, (index) {
    //       // Calculate the position for each divider
    //       double position = (index) * (100 / 6) + 8;

    //       return Positioned(
    //         left: position *
    //             3.8, // Multiply by a factor for scaling and centering
    //         child: Container(
    //           height: 20,
    //           width: 1,
    //           color: Colors.black,
    //         ),
    //       );
    //     }),
    //   ],
    // );
  }
}
