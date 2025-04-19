import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/RegisterContent.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/bloc/RegisterBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/bloc/RegisterState.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          return RegisterContent(state);
        },
      ),
    );
  }
}
