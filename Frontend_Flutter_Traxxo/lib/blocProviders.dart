import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporte_carga_flutter/injection.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/users/UsersUseCases.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/login/bloc/LoginBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/login/bloc/LoginEvent.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/bloc/RegisterBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/bloc/RegisterEvent.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoEvent.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<LoginBloc>(
    create:
        (context) => LoginBloc(locator<AuthUseCases>())..add(LoginInitEvent()),
  ),
  BlocProvider<RegisterBloc>(
    create:
        (context) =>
            RegisterBloc(locator<AuthUseCases>())..add(RegisterInitEvent()),
  ),
  BlocProvider<ClientHomeBloc>(
    create: (context) => ClientHomeBloc(locator<AuthUseCases>()),
  ),
  BlocProvider<ProfileInfoBloc>(
    create:
        (context) =>
            ProfileInfoBloc(locator<AuthUseCases>())..add(GetUserInfo()),
  ),
  BlocProvider<ProfileUpdateBloc>(
    create:
        (context) => ProfileUpdateBloc(
          locator<UsersUseCases>(),
          locator<AuthUseCases>(),
        ),
  ),
];
