import 'package:flutter/material.dart';
import 'package:diet_io/components/my_button.dart';
import 'package:diet_io/components/my_textfield.dart';
import 'package:diet_io/pages/choice.dart';
import 'package:diet_io/pages/login_page.dart';
import 'package:diet_io/services/firebase_manager.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Welcome! Glad to see you!",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 45),
                MyTextfield(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyTextfield(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 25),
                MyTextfield(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 26),
                MyTextfield(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 45),
                if (_isLoading)
                  CircularProgressIndicator()
                else
                  MyButton(
                    butonText: "Register",
                    onTap: () async {
                      setState(() {
                        _isLoading = true;
                      });
                      try {
                        final email = emailController.text.trim();
                        final password = passwordController.text.trim();
                        final confirmPassword = confirmPasswordController.text.trim();

                        if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
                          throw Exception('Please fill all fields');
                        }

                        if (password != confirmPassword) {
                          throw Exception('Passwords do not match');
                        }

                        await FirebaseManager.signUp(email, password);

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => Choice()),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(e.toString())),
                        );
                      } finally {
                        setState(() {
                          _isLoading = false;
                        });
                      }
                    },
                  ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a member?', style: TextStyle(fontSize: 17)),
                    SizedBox(width: 4),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      child: Text(
                        'Login now',
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

