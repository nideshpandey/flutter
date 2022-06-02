import 'package:flutter/material.dart';
import 'package:notes_shared_pref/screens/models.dart';
import 'package:notes_shared_pref/screens/sharedpref_services.dart';

class NoteDetail extends StatefulWidget {
  const NoteDetail({Key? key}) : super(key: key);

  @override
  State<NoteDetail> createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  final sharedPref = SharedPref();
  final dropdownValue = ['Light', 'Dark'];
  final titleController = TextEditingController();
  final descController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Note')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: DropdownButton<String>(
              hint: const Text('Priority'),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              onChanged: (String? newValue) {
                setState(() {});
              },
              items:
                  dropdownValue.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: 'Username',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: descController,
              decoration: InputDecoration(
                  hintText: 'Note',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextButton(
              onPressed: () async{
                await saveNote();
                if(!mounted){
                  return ;
                }
                Navigator.pop(context);
              },
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColorLight,
              ),
              child: const Text(
                'Save',
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future saveNote()async{
    final note = Notes(
      username: titleController.text,
      notes: descController.text
    );
    print(note);

    await sharedPref.saveNote(note); 


  }
}
