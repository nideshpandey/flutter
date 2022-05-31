import 'package:flutter/material.dart';
import 'package:webview_package/homepage.dart';

class InitialPage extends StatefulWidget {
  const InitialPage({Key? key}) : super(key: key);

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () => setState(() {
        textController.clear();
      }),
      child: const Icon(Icons.refresh),),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Enter the website: ',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: TextField(
              enableSuggestions: false,
              autocorrect: false,
              decoration: const InputDecoration(
                hintText: 'Eg: google.com'
              ),
              controller: textController,
              keyboardType: TextInputType.text,
            
            ),
          ),
          const Padding(padding: EdgeInsets.only(top: 20)),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(url: textController.text)));
              },
              child: const Text(
                'Enter',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ))
        ],
      )),
    );
  }
}
