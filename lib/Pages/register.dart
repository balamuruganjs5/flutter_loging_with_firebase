import 'package:basic_login/Components/button.dart';
import 'package:basic_login/Components/input_field.dart';
import 'package:basic_login/Components/oAuth_login_tile.dart';
import 'package:basic_login/Services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // ? Sign in function
  void signUp() async{
    if(passwordController.text == confirmPasswordController.text){
      FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text);
    }else{
      showDialog(context: context, builder: (context){
        return const AlertDialog(
          title: Text('Password mismated!.')
        );
      });
    }
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
                Text('Let\'s create an account for you!.', style: TextStyle(fontSize: 16, color: Colors.grey.shade600)),
                const SizedBox(height: 25),
            
                // email input
                InputField(controller: emailController, hintText: 'Email', obscureText: false),
                const SizedBox(height: 15),
            
                // password input
                InputField(controller: passwordController, hintText: 'Password', obscureText: true),
                const SizedBox(height: 15),
            
                // confirm password input
                InputField(controller: confirmPasswordController, hintText: 'Confirm Password', obscureText: true),
                const SizedBox(height: 25),
            
                // Login button
                Button(onTap: signUp, title: 'Sign Up',),
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
                      OAuthLoginTile(imagePath: 'lib/assets/png/google.png', onTap: () => AuthService().signInWithGoogle()),
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
                    Text('Already have an account?', style: TextStyle(color: Colors.grey.shade600)),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text('Login', style: TextStyle(color: Colors.blue.shade600, fontWeight: FontWeight.bold)))
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