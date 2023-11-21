import 'package:flutter/material.dart';
import 'package:past_calculator/models/history_model.dart';

class CalculatorCard extends StatelessWidget {
  final HistoryModel? historyModel;
  const CalculatorCard({super.key, this.historyModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Card(
            child: ListTile(
              title: Text(
                'Parameters: ${historyModel?.firstNumber} between ${historyModel?.secondNumber}',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              subtitle: Text(
                'Sum: ${historyModel?.sum}',
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
