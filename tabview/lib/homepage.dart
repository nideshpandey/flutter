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

  void getDataResponse() async {
    final res = await userService.sendData(titleController.text,
        bodyController.text, int.parse(idController.text));

    setState(() {
      titleController.clear();
      bodyController.clear();
      idController.clear();
    });
    showAlertDialog(context);
    print(res.body);
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      content: const Text("The data is submitted !"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
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
            elevation: 5,
            child: GridTile(
                header: Center(child: Text(data[index].name)),
                footer: Center(child: Text(data[index].username)),
                child: const Center(child: Text('Photo')))));
  }

  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  final idController = TextEditingController();

  Widget textField() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 200,
            child: TextField(
              controller: idController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: 'ID',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 300,
            child: TextField(
              controller: titleController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: 300,
            child: TextField(
              controller: bodyController,
              textAlign: TextAlign.center,
              decoration: const InputDecoration(
                labelText: 'Body',
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: OutlinedButton(
            onPressed: getDataResponse,
            child: const Text('Submit'),
          ),
        )
      ],
    );
  }
}
