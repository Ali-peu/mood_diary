part of 'mood_diary_bloc.dart';

@immutable
sealed class MoodDiaryEvent {
  const MoodDiaryEvent();
}

final class SetFeelingType extends MoodDiaryEvent {
  final int id;

  const SetFeelingType({required this.id});
}

final class SetStressValue extends MoodDiaryEvent {
  final double value;

  const SetStressValue({required this.value});
}

final class SetSelfAssessmentValue extends MoodDiaryEvent {
  final double value;

  const SetSelfAssessmentValue({required this.value});
}

final class SaveAnswer extends MoodDiaryEvent {
  const SaveAnswer();
}


final class SetInitialStatus extends MoodDiaryEvent {
  const SetInitialStatus();
}