import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Refresher',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.lightBlue,
        )
      ),
      home: const RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  State<RandomWords> createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  void savePushed() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: biggerFont,
                ),
              );
            },
          );
          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: tiles.toList()),
          );
        },
      ),
    );
  }

  List<WordPair> wordPair = generateWordPairs().take(30).toList();

  final saved = <WordPair>{};
  final biggerFont = const TextStyle(fontSize: 17);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: savePushed,
              icon: const Icon(Icons.thumb_up),
              color: Colors.red)
        ],
        centerTitle: true,
        title: const Text('Startup Namer'),
      ),
      body: Center(
        //child: Text('This is the part displayed in the center.'),
        child: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: wordPair.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final alreadySaved = saved.contains(wordPair[index]);
            return ListTile(
              leading: Text('${index + 1}'),
              trailing: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
                semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
              ),
              onTap: () {
                setState(() {
                  alreadySaved
                      ? saved.remove(wordPair[index])
                      : saved.add(wordPair[index]);
                });
              },
              title: Text(
                wordPair[index].asPascalCase,
                style: biggerFont,
              ),
            );
          },
        ),
      ),
    );
  }
}
