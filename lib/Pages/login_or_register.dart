import 'package:basic_login/Pages/login.dart';
import 'package:basic_login/Pages/register.dart';
import 'package:flutter/material.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  bool isShowLogin = true;

  void toggleIsShowLogin(){
    setState(() {
      isShowLogin = !isShowLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(isShowLogin){
      return LoginPage(onTap: toggleIsShowLogin);
    }else{
      return RegisterPage(onTap: toggleIsShowLogin);
    }
  }
}