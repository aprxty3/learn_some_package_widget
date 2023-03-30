import 'package:flutter/material.dart';
import 'package:learn_some_package_widget/package_widget/textfield_validator_with_controller.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'Material App', home: ListOfWidget());
  }
}

class ListOfWidget extends StatelessWidget {
  const ListOfWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Of Widget'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        padding: const EdgeInsets.all(20),
        children: [
          //TextField Validator
          InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => TextFieldValidator(
                  onSubmit: (String value) {},
                ),
              ),
            ),
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(20),
              child: const Center(
                child: Text('TextField Validator'),
              ),
            ),
          ),
          //TextFormField Validator
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
              child: const Center(
                child: Text('TextFormField Validator'),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(20),
              child: const Center(
                child: Text('Belum Terisi'),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(20),
              child: const Center(
                child: Text('Belum Terisi'),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: Colors.lightGreenAccent,
              borderRadius: BorderRadius.circular(20),
              child: const Center(
                child: Text('Belum Terisi'),
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(20),
            child: Material(
              color: Colors.greenAccent,
              borderRadius: BorderRadius.circular(20),
              child: const Center(
                child: Text('Belum Terisi'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
