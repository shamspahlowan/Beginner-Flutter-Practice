import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:beginner_practice/bloc_practice/cubit_practice/api_calling/models/user_model.dart';

class ApiService {
  Future<List<UserModel>> getUser() async {
    final uri = Uri.parse("https://jsonplaceholder.typicode.com/users");

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data.map((e) => UserModel.fromJson(e)).toList();
      } else {
        print("Failed to fetch users: ${response.statusCode}");
        return [];
      }
    } catch (e) {
      // Replace with logger in production
      print("Error fetching users: $e");
      return [];
    }
  }
}
