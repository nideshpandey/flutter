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
  final heightController = TextEditingController();

  final weightController = TextEditingController();
  bool calcStatus = false;
  dynamic bmi;

  void calculateBMI(double height, double weight) {
    double result = weight / (height * height);

    setState(() {
      bmi = result.toStringAsFixed(2);
      calcStatus = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Referesher',
      home: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    bmi = '';
                    heightController.clear();
                    weightController.clear();
                  });
                },
                icon: const Icon(Icons.refresh))
          ],
          centerTitle: true,
          title: const Text('Body Mass Index Calculator'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text('Enter height and weight to calculate BMI !'),
              const SizedBox(height: 30.0),
              TextField(
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  hintText: 'Enter height in meter',
                ),
                controller: heightController,
              ),
              const SizedBox(height: 30.0),
              TextField(
                onChanged: (value) => setState(() {}),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  hintText: 'Enter weight in kilogram',
                ),
                controller: weightController,
              ),
              const SizedBox(height: 30.0),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(17.0),
                ))),
                onPressed: () {
                  calculateBMI(double.parse(heightController.value.text),
                      double.parse(weightController.value.text));
                },
                child: const Text(
                  'Calculate',
                ),
              ),
              const SizedBox(height: 30.0),
              Text(
                'Your height is ${heightController.text}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.blueAccent),
              ),
              const SizedBox(height: 30.0, width: 30.0),
              Text('Your weight is ${weightController.text}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueAccent)),
              const SizedBox(height: 30.0, width: 30.0),
              Text(calcStatus ? 'Your BMI is $bmi' : '',
                  style: const TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
