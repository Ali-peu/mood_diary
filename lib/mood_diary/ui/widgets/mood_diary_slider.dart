import 'package:flutter/material.dart';

class MoodDiarySlider extends StatefulWidget {
  final String sliderLowValue;
  final String sliderHightValue;

  const MoodDiarySlider(
      {super.key,
      required this.sliderLowValue,
      required this.sliderHightValue});

  @override
  State<MoodDiarySlider> createState() => _MoodDiarySliderState();
}

class _MoodDiarySliderState extends State<MoodDiarySlider> {
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: const Color.fromRGBO(182, 161, 192, 0.11),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
        child: LayoutBuilder(builder: (context, constraints) {
          return Column(
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) {
                        return Container(
                            width: 1,
                            height: 10,
                            color: const Color.fromRGBO(225, 221, 216, 1));
                      }),
                    ),
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: const Color.fromRGBO(255, 135, 2, 1),
                      inactiveTrackColor:
                          const Color.fromRGBO(225, 221, 216, 1),
                      thumbShape: CustomSliderThumbShape(),
                      // Радиус для выделенной области
                      thumbColor: const Color.fromRGBO(
                          255, 135, 2, 1), // Оранжевый цвет для центра
                      disabledThumbColor: const Color.fromRGBO(255, 135, 2, 1),
                      valueIndicatorColor: const Color.fromRGBO(255, 135, 2, 1),
                    ),
                    child: Slider(
                      value: _sliderValue,
                      min: 0.0,
                      max: 6,
                      onChanged: (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.sliderLowValue,
                    style: const TextStyle(
                        color: Color.fromRGBO(225, 221, 216, 1), fontSize: 14),
                  ),
                  Text(
                    widget.sliderHightValue,
                    style: const TextStyle(
                        color: Color.fromRGBO(225, 221, 216, 1), fontSize: 14),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}

class CustomSliderThumbShape extends SliderComponentShape {
  final double thumbRadius;

  CustomSliderThumbShape({this.thumbRadius = 12.0});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(thumbRadius * 2, thumbRadius * 2);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required Size sizeWithOverflow,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double textScaleFactor,
    required double value,
  }) {
    final Canvas canvas = context.canvas;

    // Белая граница
    Paint paintBorder = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0; // Увеличьте, если хотите более толстую границу

    // Оранжевый центр
    Paint paintCenter = Paint()
      ..color = const Color.fromRGBO(255, 135, 2, 1)
      ..style = PaintingStyle.fill;

    // Рисуем белую границу
    canvas.drawCircle(center, thumbRadius, paintBorder);
    // Рисуем оранжевый центр
    canvas.drawCircle(
        center, thumbRadius - 3.0, paintCenter); // Немного уменьшен для центра
  }
}
