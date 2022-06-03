import 'package:flutter/material.dart';
import 'package:network_request/data_services.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({Key? key,required this.title}) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final requestInstance = DataService();
  String? response; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),

      ),
      body: Center(
        child: Builder(
          builder: (context) {

            return (response != null) ? Text(response!) : TextButton(onPressed: makeReq, child: Text('Get Data'));
          }
        ),
      ),
    );
    
  }
  void makeReq() async{

    final res = await requestInstance.getRequest();
    setState(() {
      response = res;
    });




  }
}