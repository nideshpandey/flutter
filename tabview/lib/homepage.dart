import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tabview/models.dart';
import 'package:tabview/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final userService = UserService();
  List<User> data = [];

  @override
  void initState() {
    super.initState();
    getData();
    getDataResponse();
  }

  void getData() async {
    data = await userService.getUserDetails();
    setState(() {});

    //print(data.name);
  }

  void getDataResponse() async{
    final res = await userService.sendData('New Title', 'New Body', 1);

    print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Tabs'),
            bottom: const TabBar(
              tabs: [
                Text(
                  'List',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Grid',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Text Field',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [listView(), gridView(), textField()],
          )),
    );
  }

  Widget listView() {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) => Card(
        elevation: 3,
        child: ListTile(
          title: Center(child: Text(data[index].name)),
          subtitle: Center(child: Text(data[index].username)),
        ),
      ),
    );
  }

  Widget gridView() {
    return GridView.builder(
        itemCount: data.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) => Card(
            elevation: 5, child: GridTile(
              header: Center(child: Text(data[index].name)),
              footer: Center(child: Text(data[index].username)),
              child: const Center(child: Text('Photo')))));
  }

  Widget textField(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
        ),
      ],
    );
  }
}
