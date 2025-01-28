import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeelingChoiceChip extends StatefulWidget {
  const FeelingChoiceChip({super.key});

  @override
  State<FeelingChoiceChip> createState() => _FeelingChoiceChipState();
}

class _FeelingChoiceChipState extends State<FeelingChoiceChip> {
  final Map<int, String> feelingMap = {
    0: 'joy',
    1: 'fear',
    2: 'rage',
    3: 'sad',
    4: 'calmness',
    5: 'power',
  };
  String? selectedFeeling;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: feelingMap.length,
                itemBuilder: (context, index) {
                  final name = feelingMap[index];
                  return Container(
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(color: Color.fromRGBO(182, 161, 192, 0.11))
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    height: 200,
                    width: 120,
                    child: Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            'assets/icons/$name.png',
                            height: 80,
                            width: 100,
                            fit: BoxFit.contain,
                          ),
                        ),
                        Text(name.toString())
                      ],
                    ),
                  );
                },
              ),
            ),
            FormBuilderFilterChip<String>(
                showCheckmark: false,
                selectedColor: const Color.fromRGBO(255, 135, 2, 1),
                disabledColor: Colors.white,
                shadowColor: const Color.fromRGBO(182, 161, 192, 0.11),
                spacing: 8,
                side: BorderSide.none,
                backgroundColor: Colors.white,
                name: 'fa',
                options: [
                  'Возбуждение',
                  'Восторг',
                  'Игривость',
                  'Наслаждение',
                  'Очарование',
                  'Осознанность',
                  'Смелость',
                  'Энергичность',
                  'Удовольствие',
                  'Экстравагантность'
                ]
                    .map((e) => FormBuilderChipOption<String>(
                          value: e,
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              e,
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(76, 76, 105, 1)),
                            ),
                          ),
                        ))
                    .toList()),
          ],
        ));
  }
}
