import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthService {
  String? _token;
  bool get isAuthenticated => _token != null;

  static String baseUrl = '${dotenv.env["API_URL"]}:${dotenv.env["PORT"]}/api';

  Future<bool> login(String email, String password) async {
    
    final response = await http.post(
      Uri.parse('$baseUrl/login'),
      body: {
        'email'     : email,
        'password'  : password,
      }
    );

    if(response.statusCode == 200) {
      _token = response.body;
      return true;
    }else{
      return false;
    }
  }

  Future<void> logout() async {

    final response = await http.post(
      Uri.parse('$baseUrl/logout'),
      headers: {
        'Authorization' : 'Bearer $_token'
      }
    );

    if(response.statusCode == 200){
      _token = null;
    }

  }  
}