import 'package:flutter/material.dart';
import 'package:login_app/services/auth_service.dart';


class AuthProvider with ChangeNotifier {
  final AuthService authService;

  AuthProvider({
    required this.authService
  });


  bool _isLogin = false;
  bool get isLogin => _isLogin;

  Future<void> login(String email, String password) async {
       try {

        // Api request to login
        await authService.login(email, password);
        
         
       } catch (e) {
         rethrow;
       }
  }
}