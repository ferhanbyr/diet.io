import 'package:flutter/material.dart';
import 'package:diet_io/components/my_button.dart';
import 'package:diet_io/components/my_textfield.dart';
import 'package:diet_io/components/square_tile.dart';
import 'package:diet_io/pages/choice.dart';
import 'package:diet_io/pages/register_page.dart';
import 'package:diet_io/services/firebase_manager.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 226, 220, 220),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                SizedBox(height: 50),
                const Text(
                  "welcome",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 24),
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                SizedBox(height: 25),
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                const Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 76, 66, 66),
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 25),
                MyButton(
                  onTap: () async {
                    try {
                      final email = emailController.text.trim();
                      final password = passwordController.text.trim();
                      
                      if (email.isNotEmpty && password.isNotEmpty) {
                        await FirebaseManager.signIn(email, password);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Choice()),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Please enter both email and password.')),
                        );
                      }
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Login failed: ${e.toString()}')),
                      );
                    }
                  },
                  butonText: 'Login',
                ),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      Text("Or continue with"),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(
                      imagePath: 'assets/images/google.png',
                    ),
                    SizedBox(width: 15),
                    SquareTile(
                      imagePath: 'assets/images/apple.png',
                    )
                  ],
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?', style: TextStyle(fontSize: 17)),
                    SizedBox(width: 4),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: Text(
                        'Register now',
                        style: TextStyle(color: Color.fromRGBO(93, 226, 81, 1)),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

