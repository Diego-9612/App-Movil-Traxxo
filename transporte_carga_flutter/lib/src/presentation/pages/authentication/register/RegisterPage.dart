import 'package:flutter/material.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/RegisterContent.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RegisterContent(),
    );
  }
}