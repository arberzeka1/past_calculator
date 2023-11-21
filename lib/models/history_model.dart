class HistoryModel {
  final int? firstNumber;
  final int? secondNumber;
  final int? sum;

  const HistoryModel({
    this.firstNumber,
    this.secondNumber,
    this.sum,
  });

  factory HistoryModel.fromMap(Map<String, dynamic> map) {
    return HistoryModel(
      firstNumber: map['firstNumber'] as int,
      secondNumber: map['secondNumber'] as int,
      sum: map['sum'] as int,
    );
  }
}
