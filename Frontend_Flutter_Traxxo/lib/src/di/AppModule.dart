import 'package:injectable/injectable.dart';
import 'package:transporte_carga_flutter/src/data/dataSource/local/SharefPref.dart';
import 'package:transporte_carga_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:transporte_carga_flutter/src/data/repository/AuthRepositoryImpl.dart';
import 'package:transporte_carga_flutter/src/domain/repository/AuthRepository.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/auth/SaveUserSessionUseCase.dart';

@module
abstract class AppModule {
  
  @injectable
  SharefPref get sharefPref => SharefPref();

  @injectable
  AuthService get authService => AuthService();

  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService, sharefPref);

  @injectable
  AuthUseCases get authUseCases =>
      AuthUseCases(
        login: LoginUseCase(authRepository),
        register: RegisterUseCase(authRepository),
        saveUserSession: SaveUserSessionUseCase(authRepository),
        getUserSession: GetUserSessionUseCase(authRepository),
        logout: LogoutUseCase(authRepository)
      );
}