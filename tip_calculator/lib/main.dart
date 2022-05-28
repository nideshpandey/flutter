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
  final amountController = TextEditingController();
  final tipController = TextEditingController();
  String? totalTipAmount;
  bool totalTipStatus = false;
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: (){
          setState(() {
            amountController.clear();
            tipController.clear();
            totalTipStatus = false;
          });
        }, child: const Icon(Icons.refresh),),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter the amount: '),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: SizedBox(
                width: 70,
                child: TextField(
                  controller: amountController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      hintText: 'Rs.100',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17)),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
            ),
            const Text('Enter tip percent: '),
            Padding(
              padding: const EdgeInsets.all(17.0),
              child: SizedBox(
                width: 50,
                child: TextField(
                  controller: tipController,
                  textAlign: TextAlign.center,
                  decoration: const InputDecoration(
                      hintText: '5%',
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17)),
                  keyboardType:
                      const TextInputType.numberWithOptions(decimal: true),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 20)),
            TextButton(
              onPressed: calculateTip,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text(
                'Calculate',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: totalTipStatus
                  ? Text('The tip amount is: Rs $totalTipAmount')
                  : const Text(''),
            )
          ],
        )),
      ),
    ));
  }

  void calculateTip() {
    final totalAmount = double.parse(amountController.text);
    final tip = double.parse(tipController.text);

    setState(() {
      totalTipAmount = (totalAmount * (tip/100 )).toStringAsFixed(2);
      totalTipStatus = true;
    });
  }
}
