import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporte_carga_flutter/src/domain/utils/Resource.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/login/LoginContent.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/login/bloc/LoginBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/login/bloc/LoginState.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final response = state.response;
          if (response is ErrorData) {
            print('Error Data: ${response.message}');
          } else if (response is Success) {
            print('Success Dta: ${response.data}');
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            final response = state.response;
            if (response is Loading) {
              return Center(child: CircularProgressIndicator());
            }
            return LoginContent(state);
          },
        ),
      ),
    );
  }
}
