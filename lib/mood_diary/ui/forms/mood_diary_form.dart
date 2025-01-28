import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mood_diary/mood_diary/bloc/mood_diary_bloc.dart';
import 'package:mood_diary/mood_diary/ui/widgets/feeling_choice_chip.dart';
import 'package:mood_diary/mood_diary/ui/widgets/form_text.dart';
import 'package:mood_diary/mood_diary/ui/widgets/mood_diary_slider.dart';

class MoodDiaryForm extends StatefulWidget {
  const MoodDiaryForm({super.key});

  @override
  State<MoodDiaryForm> createState() => _MoodDiaryFormState();
}

class _MoodDiaryFormState extends State<MoodDiaryForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // Ключ формы
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoodDiaryBloc, MoodDiaryState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Form(
              key: _formKey,
              child: ListView(
                // mainAxisSize: MainAxisSize.min,
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FormText(text: 'Что чувстуешь?'),
                  const FeelingChoiceChip(),
                  const FormText(text: 'Уровень стресса'),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: MoodDiarySlider(
                      sliderLowValue: 'Низкий',
                      sliderHightValue: 'Высокий',
                    ),
                  ),
                  const FormText(text: 'Самооценка'),
                  const Padding(
                    padding: EdgeInsets.all(8),
                    child: MoodDiarySlider(
                      sliderLowValue: 'Неуверенность',
                      sliderHightValue: 'Уверенность',
                    ),
                  ),
                  const FormText(text: 'Заметки'),
                  DecoratedBox(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(13),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(color: Color.fromRGBO(182, 161, 192, 0.11)),
                          BoxShadow(color: Color.fromRGBO(182, 161, 192, 0.11)),
                          BoxShadow(color: Color.fromRGBO(182, 161, 192, 0.11)),
                          BoxShadow(color: Color.fromRGBO(182, 161, 192, 0.11)),
                        ]),
                    child: TextFormField(
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Введите заметку',
                          contentPadding: EdgeInsets.fromLTRB(6, 8, 2, 5),
                          hintStyle: TextStyle(
                              fontSize: 18,
                              color: Color.fromRGBO(188, 188, 191, 1))),
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        decorationThickness: 0,
                      ),
                      maxLines: 3,
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
