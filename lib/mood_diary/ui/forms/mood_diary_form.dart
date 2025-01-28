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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FormText(text: 'Что чувстуешь?'),
                  const SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: ColoredBox(color: Colors.red)),
                  const FormText(text: 'Уровень стресса'),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: SliderWithDividers(),
                  ),
                  const FormText(text: 'Самооценка'),
                  const FormText(text: 'Заметки'),
                ],
              )),
        );
      },
    );
  }
}
