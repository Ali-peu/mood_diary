part of 'mood_diary_bloc.dart';

enum ScreenStatus{initial,error, success}

class MoodDiaryState extends Equatable {
  final int? feelingType;
  final double? stressValue;
  final double? selfAssessmentValue;
  final ScreenStatus screenStatus;

  const MoodDiaryState({
    this.feelingType,
    this.stressValue,
    this.selfAssessmentValue,
    this.screenStatus = ScreenStatus.initial
  });

  MoodDiaryState copyWith({
    int? feelingType,
    double? stressValue,
    double? selfAssessmentValue,
    ScreenStatus? screenStatus
  }) {
    return MoodDiaryState(
      feelingType: feelingType ?? this.feelingType,
      stressValue: stressValue ?? this.stressValue,
      selfAssessmentValue: selfAssessmentValue ?? this.selfAssessmentValue,
      screenStatus: screenStatus ?? this.screenStatus
    );
  }

  @override
  List<Object?> get props => [feelingType, stressValue, selfAssessmentValue,screenStatus];
}
