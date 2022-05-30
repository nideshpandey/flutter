import 'package:cards_widget/card.dart';
import 'package:cards_widget/card_view.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<Cards> cards = [
    Cards(
        question: 'Which programming language does Fluter use ?',
        answer: 'Dart'),
    Cards(
        question: 'Which programming language does Node.js use ?',
        answer: 'JavaScript'),
    Cards(
        question: 'Which programming language does TensorFlow use ?',
        answer: 'Python'),
  ];

  int currentIndex = 0;

  void showNext() {
    setState(() {
      currentIndex = (currentIndex + 1 < cards.length) ? currentIndex + 1 : 0;
    });
  }

  void showPrev() {
    setState(() {
      currentIndex =
          (currentIndex - 1 >= 0) ? currentIndex - 1 : cards.length - 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Card Flip'), centerTitle: true,),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 200,
              child: FlipCard(
                fill: Fill.fillBack,
                direction: FlipDirection.HORIZONTAL,
                front: CardView(
                  text: cards[currentIndex].question,
                ),
                back: CardView(
                  text: cards[currentIndex].answer,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton.icon(
                    onPressed: showPrev,
                    icon: const Icon(Icons.fork_left),
                    label: const Text('Prev'),
                  ),
                  OutlinedButton.icon(
                    onPressed: showNext,
                    icon: const Icon(Icons.fork_right),
                    label: const Text('Next'),
                  ),
                ],
              ),
            )
          ],
        )),
      ),
    ));
  }
}
