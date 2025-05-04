import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporte_carga_flutter/injection.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/login/bloc/LoginBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/login/bloc/LoginEvent.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/bloc/RegisterBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/bloc/RegisterEvent.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(create: (context)=> LoginBloc(locator<AuthUseCases>())..add(LoginInitEvent())),
  BlocProvider<RegisterBloc>(create: (context)=> RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent())),
  BlocProvider<ClientHomeBloc>(create: (context)=> ClientHomeBloc(locator<AuthUseCases>())),
];