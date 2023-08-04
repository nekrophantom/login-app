import 'package:http/http.dart' as http;


import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {

  static String baseUrl = '${dotenv.env["API_URL"]}:${dotenv.env["PORT"]}/api/login';

  Future<void> login(String email, String password) async {
    
    final response = await http.post(Uri.parse(baseUrl));
  }
}