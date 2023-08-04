import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
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
            onTap: () {
              
            },
          )

        ],
      ),
    );
  }
}