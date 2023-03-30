import 'package:flutter/material.dart';

class TextFormFieldValidator extends StatefulWidget {
  const TextFormFieldValidator({super.key, required this.onSubmit});
  final ValueChanged<String> onSubmit;

  @override
  State<TextFormFieldValidator> createState() => _TextFormFieldValidatorState();
}

class _TextFormFieldValidatorState extends State<TextFormFieldValidator> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  bool _submitted = false;
  void _submit() {
    setState(() {
      _submitted = true;
    });
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      widget.onSubmit(_name);
      print(_name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFormField Validator'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Enter your Name',
                ),
                autovalidateMode: _submitted
                    ? AutovalidateMode.onUserInteraction
                    : AutovalidateMode.disabled,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Please enter your name';
                  } else if (text.length < 6) {
                    return 'Name must be at least 6 characters';
                  }
                  return null;
                },
                onChanged: (text) => setState(() => _name = text),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  _name.isNotEmpty ? _submit : null;
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
