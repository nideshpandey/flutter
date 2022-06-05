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
  }

  void getData() async {
    data = await userService.getUserDetails();
    setState(() {});

    //print(data.name);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [listView(), gridView()],
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
}
