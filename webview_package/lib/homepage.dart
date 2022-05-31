import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final webviewController = Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: const Text('WebView of website'),
        centerTitle: true,
      ),
      body: WebView(
        initialUrl: 'https://${widget.url}',
        onWebViewCreated: (controller) =>
            webviewController.complete(controller),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ButtonBar(
            children: [
              bottomNavigationButton(
                  Icons.chevron_left, (controller) => goBack(controller)),
              bottomNavigationButton(
                  Icons.chevron_right, (controller) => goForward(controller))
            ],
          ),
        ),
      ),
    ));
  }

  Widget bottomNavigationButton(
      IconData icon, Function(WebViewController) onPressed) {
    return FutureBuilder(
      future: webviewController.future,
      builder: (context, AsyncSnapshot<WebViewController> snapshot) {
        if (snapshot.hasData) {
          return IconButton(
              icon: Icon(
                icon,
                color: Colors.black,
              ),
              onPressed: () => onPressed(snapshot.data!));
        } else {
          return Container();
        }
      },
    );
  }

  void goForward(WebViewController controller) async {
    final canGoForward = await controller.canGoForward();
    if (canGoForward) {
      controller.goForward();
    }
  }

  void goBack(WebViewController controller) async {
    final canGoBack = await controller.canGoBack();
    if (canGoBack) {
      controller.goBack();
    }
  }
}
