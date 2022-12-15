import 'dart:convert';
import 'package:prak_mobile/models/user.dart';
import 'package:http/http.dart' as http;

class ApiUser {
  final String apiUrl = "http://192.168.100.104:3000/user";

  Future<List<User>> fecthDataUser() async {
    var result = await http.get(Uri.parse(apiUrl));
    List<dynamic> listJson = json.decode(result.body);
    // print(listJson);
    print(listJson.map((e) => User.fromJson(e)).toList().toString());
    return listJson.map((e) => User.fromJson(e)).toList();
  }
}
