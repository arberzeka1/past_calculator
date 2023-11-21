import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:past_calculator/bloc/number_bloc/numbers_bloc.dart';
import 'package:past_calculator/bloc/number_bloc/numbers_state.dart';
import 'package:past_calculator/widgets/calculator_card.dart';

class PastResultsScreen extends StatelessWidget {
  const PastResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Past Results'),
      ),
      body: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: state.sumList.length,
            itemBuilder: (context, index) {
              var history = state.sumList[index];
              return CalculatorCard(
                historyModel: history,
              );
            },
          );
        },
      ),
    );
  }
}
