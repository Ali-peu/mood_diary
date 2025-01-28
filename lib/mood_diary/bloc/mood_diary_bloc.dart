import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'mood_diary_event.dart';
part 'mood_diary_state.dart';

class MoodDiaryBloc extends Bloc<MoodDiaryEvent, MoodDiaryState> {
  MoodDiaryBloc() : super(MoodDiaryInitial()) {
    on<MoodDiaryEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
