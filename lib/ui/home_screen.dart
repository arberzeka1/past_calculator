import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:past_calculator/bloc/number_bloc/numbers_bloc.dart';
import 'package:past_calculator/bloc/number_bloc/numbers_event.dart';
import 'package:past_calculator/ui/past_result_screen.dart';
import 'package:past_calculator/ui/result_screen.dart';
import 'package:past_calculator/widgets/text_field_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _firstNumberController = TextEditingController();
  final TextEditingController _secondNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _firstNumberController.dispose();
    _secondNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                key: const Key('first_number'),
                controller: _firstNumberController,
                labelText: 'Enter first number',
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                key: const Key('second_number'),
                controller: _secondNumberController,
                labelText: 'Enter second number',
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                key: const Key('Submit'),
                onPressed: () => onSubmitButton(),
                child: const Text('Submit'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                key: const Key('Past'),
                onPressed: () => onPastResult(),
                child: const Text('Past results'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onSubmitButton() async {
    if (!formKey.currentState!.validate()) {
      return;
    }
    int firstNumber = int.tryParse(_firstNumberController.text) ?? 0;
    int secondNumber = int.tryParse(_secondNumberController.text) ?? 0;
    BlocProvider.of<CalculatorBloc>(context).add(
      SendSumEvent(firstNumber: firstNumber, secondNumber: secondNumber),
    );
    _firstNumberController.clear();
    _secondNumberController.clear();
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ResultScreen(),
      ),
    );
  }

  Future<void> onPastResult() async {
    BlocProvider.of<CalculatorBloc>(context).add(const GetSumEvent());
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PastResultsScreen(),
      ),
    );
  }
}
