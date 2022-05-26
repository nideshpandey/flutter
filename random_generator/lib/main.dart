import 'dart:math';
import 'package:flutter/material.dart';
import 'package:random_generator/name_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Random Generator',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? result;
  bool resultStatus = false;

  void flipCoin() {
    final random = Random();
    final randomNumber = random.nextInt(2);
    setState(() {
      result = randomNumber == 0 ? 'Heads' : 'Tails';

      resultStatus = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Random Generator'),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(50),
            child: SizedBox(
              height: 250,
              width: 250,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(50.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Flip a Coin',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 30)),
                      ElevatedButton(
                        onPressed: () {
                          flipCoin();
                        },
                        child: const Text('Flip'),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 20)),
                      resultStatus
                          ? Text('The result is $result')
                          : const Text(''),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        const Padding(padding: EdgeInsets.only(top: 20)),
        Center(
          child: Container(
            padding: const EdgeInsets.all(40),
            color: Colors.greenAccent,
            child: const NamePicker(),
          ),
        )
      ]),
    );
  }
}
