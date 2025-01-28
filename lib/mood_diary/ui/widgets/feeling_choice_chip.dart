import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mood_diary/mood_diary/bloc/mood_diary_bloc.dart';

class FeelingChoiceChip extends StatefulWidget {
  const FeelingChoiceChip({super.key});

  @override
  State<FeelingChoiceChip> createState() => _FeelingChoiceChipState();
}

class _FeelingChoiceChipState extends State<FeelingChoiceChip> {
  String? selectedFeeling;

  @override
  Widget build(BuildContext context) {
    final blocValue = context.read<MoodDiaryBloc>();
    return BlocBuilder<MoodDiaryBloc, MoodDiaryState>(
      builder: (context, state) {
        return Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: blocValue.feelingMap.length,
                    itemBuilder: (context, index) {
                      final name = blocValue.feelingMap[index];
                      return GestureDetector(
                        onTap: () {
                          blocValue.add(SetFeelingType(id: index));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(182, 161, 192, 0.11))
                              ],
                              color: Colors.white,
                              border: Border.all(
                                  color: (state.feelingType == index)
                                      ? const Color.fromRGBO(255, 135, 2, 1)
                                      : Colors.white),
                              borderRadius: BorderRadius.circular(100)),
                          height: 200,
                          width: 100,
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/icons/$name.png',
                                height: 80,
                                width: 100,
                                fit: BoxFit.contain,
                              ),
                              Text(blocValue.getFeelingName(index))
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                if (state.feelingType != null)
                  FormBuilderFilterChip<String>(
                      decoration:
                          const InputDecoration(border: InputBorder.none),
                      showCheckmark: false,
                      selectedColor: const Color.fromRGBO(255, 135, 2, 1),
                      disabledColor: Colors.white,
                      shadowColor: const Color.fromRGBO(182, 161, 192, 0.11),
                      spacing: 8,
                      side: BorderSide.none,
                      backgroundColor: Colors.white,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Выберите поле';
                        }
                        return null;
                      },
                      name: 'feelingTypes',
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
      },
    );
  }
}
