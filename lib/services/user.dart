
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
class UserService {

  Future getAllUsers() async {
    const url = 'http://localhost:3000/users/all';
    var response = await http.get(url);
      if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var data = jsonResponse['data'];
      print(data);
      for(var user in data['users']){
        print(user);
      }
      } else {
      print('Request failed with status: ${response.statusCode}.');
      }
    }
 
}