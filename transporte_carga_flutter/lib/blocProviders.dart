import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/login/bloc/LoginBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/login/bloc/LoginEvent.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/bloc/RegisterBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/bloc/RegisterEvent.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context)=> LoginBloc()..add(LoginInitEvent())),
  BlocProvider<RegisterBloc>(create: (context)=> RegisterBloc()..add(RegisterInitEvent())),
];