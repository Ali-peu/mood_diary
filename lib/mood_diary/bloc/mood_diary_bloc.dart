import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'mood_diary_event.dart';
part 'mood_diary_state.dart';

class MoodDiaryBloc extends Bloc<MoodDiaryEvent, MoodDiaryState> {
  final Map<int, String> feelingMap = {
    0: 'joy',
    1: 'fear',
    2: 'rage',
    3: 'sad',
    4: 'calmness',
    5: 'power',
  };

  String getFeelingName(int index) {
    switch (index) {
      case 0:
        return 'Радость';

      case 1:
        return 'Страх';

      case 2:
        return 'Бешенство';

      case 3:
        return 'Грусть';

      case 4:
        return 'Спокойствие';

      case 5:
        return 'Сила';

      default:
        return '';
    }
  }

  MoodDiaryBloc() : super(const MoodDiaryState()) {
    on<SetFeelingType>((event, emit) {
      emit(state.copyWith(feelingType: event.id));
    });
    on<SetStressValue>((event, emit) {
      emit(state.copyWith(stressValue: event.value));
    });
    on<SetSelfAssessmentValue>((event, emit) {
      emit(state.copyWith(selfAssessmentValue: event.value));
    });

    on<SaveAnswer>((event, emit) {
      emit(state.copyWith(screenStatus: ScreenStatus.success));
      add(const SetInitialStatus());
    });
    on<SetInitialStatus>((event, emit) {
      emit(state.copyWith(screenStatus: ScreenStatus.initial));
    });
  }
}
