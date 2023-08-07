// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:login_app/providers/auth_provider.dart';
import 'package:login_app/routes/app_routes.dart';

class LoginPage extends ConsumerWidget {
  
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

  final formKey            = GlobalKey<FormState>();
  final emailController    = TextEditingController();
  final passwordController = TextEditingController();
  final authService = ref.watch(authProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50,),

              // Logo 
              const Icon(Icons.lock, size: 100,),

              const SizedBox(height: 50,),

              // Login Form
              Container(
                padding: const EdgeInsets.all(25),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      
                      // Email Input
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          label: Text('Email'),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email)
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 30,),

                      // Password Input
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          label: Text('Password'),
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock)
                        ),
                        validator: (value) {
                          if(value == null || value.isEmpty){
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 10,),

                      // Forgot Password?
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector     (
                            child: const Text('Forgot Password?'),
                            onTap: () {},
                          ),
                        ],
                      ),

                      const SizedBox(height: 30,),

                      // Submit Button
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                        onPressed: () async {
                            final response = await authService.login(emailController.text, passwordController.text);

                            if (response) {
                              Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.home, (route) => false);
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Login Failed')
                                )
                              );
                            }
                          }, 
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 16
                            ),
                          )
                        ),
                      )

                    ],
                  ) 
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}