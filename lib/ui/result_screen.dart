import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:past_calculator/bloc/number_bloc/numbers_bloc.dart';
import 'package:past_calculator/bloc/number_bloc/numbers_event.dart';
import 'package:past_calculator/bloc/number_bloc/numbers_state.dart';
import 'package:past_calculator/widgets/calculator_card.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  void initState() {
    BlocProvider.of<CalculatorBloc>(context).add(const GetSumEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Screen'),
      ),
      body: BlocBuilder<CalculatorBloc, CalculatorState>(
        builder: (context, state) {
          var history = state.firstModel;
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return CalculatorCard(
            historyModel: history,
          );
        },
      ),
    );
  }
}
