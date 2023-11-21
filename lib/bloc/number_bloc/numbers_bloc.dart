import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:past_calculator/bloc/number_bloc/numbers_event.dart';
import 'package:past_calculator/bloc/number_bloc/numbers_state.dart';
import 'package:past_calculator/models/history_model.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(const CalculatorState([], null, false)) {
    on<SendSumEvent>((event, emit) => calculateSumInRange(event, emit));
    on<GetSumEvent>((event, emit) => getHistoryData(event, emit));
    on<LoadingEvent>((event, emit) => emitLoadingState(emit));
  }

  Future<void> calculateSumInRange(SendSumEvent event, Emitter emit) async {
    try {
      emitLoadingState(emit);

      final HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('calculateSum');
      callable({
        'firstNumber': event.firstNumber,
        'secondNumber': event.secondNumber,
      });
    } catch (error) {
      debugPrint('Error $error');
    }
  }

  Future<void> getHistoryData(GetSumEvent event, Emitter emit) async {
    try {
      emitLoadingState(emit);

      final HttpsCallable callable =
          FirebaseFunctions.instance.httpsCallable('getHistoryData');
      final HttpsCallableResult result = await callable.call();

      var objectList = result.data;

      List<HistoryModel> historiesList = [];

      objectList.forEach((item) {
        historiesList.add(HistoryModel.fromMap(item));
      });
      final lastHistory = historiesList.isNotEmpty ? historiesList.first : null;

      emit(CalculatorState(historiesList, lastHistory, false));
    } catch (e) {
      debugPrint('Error $e');
    }
  }

  void emitLoadingState(Emitter emit) {
    emit(state.copyWith(isLoading: true));
  }
}
