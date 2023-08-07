import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_app/routes/app_routes.dart';


Future <void> main() async {

  await dotenv.load(fileName: (const bool.fromEnvironment('dart.vm.product')) ? '.env.production' : '.env');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          initialRoute: AppRoutes.login,
          routes: AppRoutes.routes,
      ),
    );
  }
}