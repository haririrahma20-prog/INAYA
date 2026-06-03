import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';
import '/register_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController =
      TextEditingController();

  final TextEditingController passwordController =
      TextEditingController();

  Future<void> login() async {
    if (emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields"),
        ),
      );
      return;
    }

    try {
      final response = await http.post(
        Uri.parse("http://192.168.1.40:3000/login"),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode({
          "email": emailController.text,
          "password": passwordController.text,
        }),
      );

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final prefs =
            await SharedPreferences.getInstance();

        await prefs.setBool(
          'isLoggedIn',
          true,
        );

        await prefs.setString(
          'username',
          data['username'] ?? '',
        );

        

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const HomePage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              data['message'],
            ),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Server connection error",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),

          child: Column(
            children: [
              const Text(
                "INAYA",
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFE91E63),
                ),
              ),

              const SizedBox(height: 40),

              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  prefixIcon:
                      const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  prefixIcon:
                      const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.circular(15),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: login,

                  style:
                      ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFFE91E63),
                    shape:
                        RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(
                        15,
                      ),
                    ),
                  ),

                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                  ),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              const RegisterPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Create Account",
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}