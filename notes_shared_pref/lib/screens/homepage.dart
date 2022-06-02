import 'package:flutter/material.dart';
import 'package:notes_shared_pref/screens/models.dart';
import 'package:notes_shared_pref/screens/note_detail.dart';
import 'package:notes_shared_pref/screens/sharedpref_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int? count = 1;

  final sharedPref = SharedPref();
  Notes? notes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInHomepage();
  }

  void getInHomepage() async{

    notes = await sharedPref.getNotes();
    setState(() {
      print(notes);

    });
  }
  

  @override
  Widget build(BuildContext context) {
    return(Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () async{
        await Navigator.push(context, MaterialPageRoute(builder: (context) => const NoteDetail(),));
        getInHomepage();
      }, 
      child: const Icon(Icons.add),),
      appBar: AppBar(title: const Text('Notes')),
      body: ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position){
          return Card(
            elevation: 3.0,
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.notes),),
              trailing: Icon(Icons.delete, color: Colors.red,),
              title: Text(notes!.username),
              subtitle: Text(notes!.notes),
            ),
          );

        }),
    ));
    
  }
}