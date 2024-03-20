import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser;

  // ? Signout function
  void signOut(){
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        actions: [IconButton(onPressed: signOut, icon: const Icon(Icons.logout, color: Colors.white))],
      ),
      body: Center(
        child: Text('LOGGED IN ${user!.email!}', style: TextStyle(color: Colors.grey.shade900),),
      ),
    );
  }
}