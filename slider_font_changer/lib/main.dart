import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double fontSize = 20;
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              textController.clear();
            });
          },
          label: const Text('Clear'),
          icon: const Icon(Icons.refresh),
        ),
        body: SafeArea(
          child: Column(children: [
            const Text('Change the Font size with the slider.'),
            Expanded(
              child: TextField(
                textInputAction: TextInputAction.done,
                style: TextStyle(fontSize: fontSize),
                maxLines: null,
                controller: textController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(70.0),
              child: Slider(
                value: fontSize,
                min: 10,
                max: 100,
                onChanged: (newSize) {
                  setState(() {
                    fontSize = newSize;
                  });
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
