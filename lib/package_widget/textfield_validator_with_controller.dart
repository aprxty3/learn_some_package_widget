import 'package:flutter/material.dart';

class TextFieldValidator extends StatefulWidget {
  const TextFieldValidator({Key? key, required this.onSubmit})
      : super(key: key);
  final ValueChanged<String> onSubmit;

  @override
  State<TextFieldValidator> createState() => _TextFieldValidatorState();
}

class _TextFieldValidatorState extends State<TextFieldValidator> {
  var textController = TextEditingController();
  var text = '';

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  String? get _errorText {
    if (textController.text.isEmpty) {
      return 'Please enter your name';
    } else if (textController.text.length < 6) {
      return 'Name must be at least 6 characters';
    } else {
      return null;
    }
  }

  void _submit() {
    if (_errorText == null) {
      widget.onSubmit(textController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextField Validator'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: textController,
              decoration: InputDecoration(
                labelText: 'Enter your Name',
                errorText: _errorText,
              ),
              onChanged: (value) => setState(() => text),
            ),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                textController.text.isNotEmpty ? _submit : null;
              },
              child: const Text('Enter'),
            ),
          ],
        ),
      ),
    );
  }
}
