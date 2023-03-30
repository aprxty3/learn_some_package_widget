import 'package:flutter/material.dart';

class TextFieldValidator extends StatefulWidget {
  const TextFieldValidator({super.key});

  @override
  State<TextFieldValidator> createState() => _TextFieldValidatorState();
}

class _TextFieldValidatorState extends State<TextFieldValidator> {
  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Validator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: 'Enter your Name',
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Enter'),
            ),
          ],
        ),
      ),
    );
  }
}
