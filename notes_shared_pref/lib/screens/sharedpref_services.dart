import 'package:notes_shared_pref/screens/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  //Below this is used to save the notes
  Future saveNote(Notes notes) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('username', notes.username);
    await preferences.setString('notes', notes.notes);
    print('Notes Saved !');
  }

  Future<Notes?> getNotes() async {
    final preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey('username')) {
      final username = preferences.getString('username');
      final notes = preferences.getString('notes');

      return Notes(username: username!, notes: notes!);
    }else{
      return Notes(username: 'Dummy', notes: 'Dummy');
    }
  }
}


