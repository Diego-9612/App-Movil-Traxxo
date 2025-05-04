import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:transporte_carga_flutter/blocProviders.dart';
import 'package:transporte_carga_flutter/injection.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/login/LoginPage.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/recover_account/RecoverAccountPage.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/RegisterPage.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/client/home/ClientHomePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        builder: FToastBuilder(),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => LoginPage(),
          'register': (BuildContext context) => RegisterPage(),
          'recover': (BuildContext context) => RecoverAccountPage(),
          'client/home': (BuildContext context) => ClientHomePage(),
        },
      ),
    );
  }
}
