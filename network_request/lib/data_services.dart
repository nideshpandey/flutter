import 'dart:convert';

import 'package:http/http.dart' as http;

class DataService{

  Future getRequest() async{
    final uri = Uri.https('jsonplaceholder.typicode.com', '/posts/1/comments');
    final response = await http.get(uri);
    
    return (response.body);

    
  }


}