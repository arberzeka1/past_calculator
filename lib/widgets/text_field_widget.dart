import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  const TextFieldWidget({
    super.key,
    this.controller,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          validator: ((value) {
            RegExp regex = RegExp(r'^[0-9]');
            if (value!.isEmpty) {
              return "Please Enter some text";
            } else if (!regex.hasMatch(value)) {
              return "Please add only Integers";
            }
            return null;
          }),
          decoration: InputDecoration(labelText: labelText),
        ),
      ),
    );
  }
}
