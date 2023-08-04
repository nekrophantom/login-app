import 'package:flutter/material.dart';
import 'package:login_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey            = GlobalKey<FormState>();
  final _emailController    = TextEditingController();
  final _passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

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
                  key: _formKey,
                  child: Column(
                    children: [
                      
                      // Email Input
                      TextFormField(
                        controller: _emailController,
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
                        controller: _passwordController,
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
                        child: Expanded(
                          child: ElevatedButton(
                          onPressed: () {
                              final email = _emailController.text;
                              final password = _passwordController.text;

                              authProvider.login(email, password);
                            }, 
                            child: const Text(
                              'Sign in',
                              style: TextStyle(
                                fontSize: 16
                              ),
                            )
                          ),
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