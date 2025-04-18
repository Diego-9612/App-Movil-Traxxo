import 'package:flutter/material.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/login/LoginContent.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueAccent,
      body: LoginContent()
      );
  }
}