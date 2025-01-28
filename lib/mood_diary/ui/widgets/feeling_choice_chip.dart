import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeelingChoiceChip extends StatefulWidget {
  const FeelingChoiceChip({super.key});

  @override
  State<FeelingChoiceChip> createState() => _FeelingChoiceChipState();
}

class _FeelingChoiceChipState extends State<FeelingChoiceChip> {
  final Map<int, String> feelingMap = {
    1: 'joy',
    2: 'fear',
    3: 'rage',
    4: 'sadness',
    5: 'calmness',
    6: 'power',
  };
  String? selectedFeeling;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        children: feelingMap.values.map((feeling) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('assets/svg/$feeling.svg'),
              Text(feeling)
            ],
          );
        }).toList(),
      ),
    );
  }
}
