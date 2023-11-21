import 'package:past_calculator/models/history_model.dart';

class CalculatorState {
  const CalculatorState(
    this.sumList,
    this.firstModel,
    this.isLoading,
  );

  final List<HistoryModel> sumList;
  final HistoryModel? firstModel;
  final bool isLoading;
  List<Object?> get props => [sumList, firstModel, isLoading];

  CalculatorState copyWith({
    List<HistoryModel>? sumList,
    HistoryModel? firstModel,
    bool? isLoading,
  }) {
    return CalculatorState(
      sumList ?? this.sumList,
      firstModel ?? this.firstModel,
      isLoading ?? this.isLoading,
    );
  }
}
