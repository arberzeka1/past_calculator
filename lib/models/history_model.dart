class HistoryModel {
  final int? firstNumber;
  final int? secondNumber;
  final int? sum;

  const HistoryModel({
    this.firstNumber,
    this.secondNumber,
    this.sum,
  });

  HistoryModel.fromMap(Map map)
      : firstNumber = map['firstNumber'],
        secondNumber = map['secondNumber'],
        sum = map['sum'];
}
