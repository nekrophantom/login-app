import 'package:flutter/material.dart';
import 'package:login_app/pages/auth/login_page.dart';
import 'package:login_app/pages/auth/register_page.dart';
import 'package:login_app/pages/home_page.dart';

class AppRoutes {
  
  static const home     = '/';
  static const login    = '/login';
  static const logout   = '/logout';
  static const register = '/register';

  static Map<String, WidgetBuilder> routes = {
    home      : (context) => HomePage(),
    login     : (context) => LoginPage(),
    register  : (context) => RegisterPage()
  };
  
}