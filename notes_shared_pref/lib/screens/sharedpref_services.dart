import 'package:notes_shared_pref/screens/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  Future saveNote(Notes notes) async {
    final preferences = await SharedPreferences.getInstance();

    await preferences.setString('title', notes.title);
    await preferences.setString('description', notes.description);
    print('Notes Saved !');
  }
}
