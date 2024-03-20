import 'package:basic_login/Components/button.dart';
import 'package:basic_login/Components/input_field.dart';
import 'package:basic_login/Components/oAuth_login_tile.dart';
import 'package:basic_login/Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  
  get onTap => null;

  // ? Sign in function
  void signin() async{
    try {

      // ? Add a loading indicator
      showDialog(context: context, builder: (context) {
        return const Center(
          child: CircularProgressIndicator()
        );
      });

      // ? Sign in via firebase
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text
      );

      // ? Remove the loading indicator
      Navigator.pop(context);

    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }


  void showErrorMessage(String message){
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.deepPurple,
        title: Text(message, style:const TextStyle(color: Colors.white),)
      );
    });
  }

  void googleSignIn() async{
    await AuthService().signInWithGoogle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body:  SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 10),

                // Logo
                const Icon(Icons.lock, size: 100),
                const SizedBox(height: 25),
            
                // Text
                Text('Welcome back you\'ve been missed!.', style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
                const SizedBox(height: 25),
            
                // email input
                InputField(controller: emailController, hintText: 'Email', obscureText: false),
                const SizedBox(height: 15),
            
                // password input
                InputField(controller: passwordController, hintText: 'Password', obscureText: true),
                const SizedBox(height: 15),
            
                // Forget password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text('Forget Password?.',
                       style: TextStyle(
                        fontSize: 13,
                        color: Colors.red.shade600
                       ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
            
                // Login button
                Button(onTap: signin, title: 'Sign In'),
                const SizedBox(height: 25),
            
                // Or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(child: 
                        Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade600,
                        )
                      ),
                      const Text('Or Continue with'),
                      Expanded(child: 
                        Divider(
                          thickness: 0.5,
                          color: Colors.grey.shade600,
                        )
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 25),
            
                // Google + Apple login
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OAuthLoginTile(imagePath: 'lib/assets/png/google.png', onTap: googleSignIn),
                      const SizedBox(width: 30),
                      OAuthLoginTile(imagePath: 'lib/assets/png/apple.png', onTap: () => {})
                    ]
                  ),
                ),
                const SizedBox(height: 25),
            
                // Not a member register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a Member?', style: TextStyle(color: Colors.grey.shade600)),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap:widget.onTap,
                       child: Text('Register now', style: TextStyle(color: Colors.blue.shade600, fontWeight: FontWeight.bold)))
                  ],
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}