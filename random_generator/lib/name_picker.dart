import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class NamePicker extends StatefulWidget {
  const NamePicker({Key? key}) : super(key: key);

  @override
  State<NamePicker> createState() => _NamePickerState();
}

class _NamePickerState extends State<NamePicker> {
  String? name;
  bool nameStatus = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
            'Pick a Startup Name generated randomly from the english_words package'),
        const Padding(padding: EdgeInsets.only(top: 10)),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                padding: const EdgeInsets.all(15),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                )),
            onPressed: () {
              setState(() {
                name = generateWordPairs().take(1).toString();
                print(name);
                nameStatus = true;
              });
            },
            child: const Text(
              'Pick Random Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        const Padding(padding: EdgeInsets.only(top: 10)),
        nameStatus
            ? Text(
                'The generated name is $name',
                style: const TextStyle(fontWeight: FontWeight.bold),
              )
            : const Text(''),
      ],
    );
  }
}
