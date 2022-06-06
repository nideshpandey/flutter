import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tabview/models.dart';

class UserService {
  Future<List<User>> getUserDetails() async {
    final uri = Uri.https('jsonplaceholder.typicode.com', '/users');

    final response = await http.get(uri);

    //print(response.body);

    final json = jsonDecode(response.body);

    //print(json);

    List<User> users = [];

    for (var user in json) {
      //print(user);
      users.add(User.fromMap(user));
    }

    return users;
  }

  Future<http.Response> sendData(String title, String body, int userId) async {
    return await http.post(
        Uri.parse('https://jsonplaceholder.typicode.com/posts'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, dynamic>{'title': title, 'body': body, 'userId': userId}));
  }
}
