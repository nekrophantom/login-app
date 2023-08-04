import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:login_app/providers/auth_provider.dart';
import 'package:login_app/routes/app_routes.dart';
import 'package:login_app/services/auth_service.dart';
import 'package:provider/provider.dart';


Future <void> main() async {

  await dotenv.load(fileName: (const bool.fromEnvironment('dart.vm.product')) ? '.env.production' : '.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(authService: AuthService()), 
        ),
        
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        initialRoute: AppRoutes.login,
        routes: AppRoutes.routes,
      ),
    );
  }
}