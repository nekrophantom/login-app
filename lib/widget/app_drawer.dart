// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_app/routes/app_routes.dart';
import 'package:login_app/services/auth_service.dart';


class AppDrawer extends ConsumerWidget {
  const AppDrawer({super.key});
  

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  final authProvider       = StateProvider<AuthService>((ref) {
    return AuthService();
  });
  final authService = ref.watch(authProvider);
    
    
    return Drawer(
      child: Column(
        children: [
          
          AppBar(
            title: const Text('Welcome'),
          ),

          InkWell(
            child: const ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
            ),
            onTap: () async {
              await authService.logout();
              Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
            },
          )

        ],
      ),
    );
  }
}