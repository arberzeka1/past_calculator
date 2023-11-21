abstract class CalculatorEvent {
  const CalculatorEvent();
}

class CalculateSumEvent extends CalculatorEvent {
  final int firstNumber;
  final int secondNumber;

  const CalculateSumEvent(this.secondNumber, this.firstNumber);
  List<Object?> get props => [firstNumber, secondNumber];
}

class GetSumEvent extends CalculatorEvent {
  const GetSumEvent();
  List<Object?> get props => [];
}

class SendSumEvent extends CalculatorEvent {
  final int? firstNumber;
  final int? secondNumber;

  const SendSumEvent({this.firstNumber, this.secondNumber});
  List<Object?> get props => [firstNumber, secondNumber];
}

class LoadingEvent extends CalculatorEvent {
  const LoadingEvent();
  List<Object?> get props => [];
}
