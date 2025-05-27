import 'package:injectable/injectable.dart';
import 'package:transporte_carga_flutter/src/data/dataSource/local/SharefPref.dart';
import 'package:transporte_carga_flutter/src/data/dataSource/remote/services/AuthService.dart';
import 'package:transporte_carga_flutter/src/data/dataSource/remote/services/UsersService.dart';
import 'package:transporte_carga_flutter/src/data/repository/AuthRepositoryImpl.dart';
import 'package:transporte_carga_flutter/src/data/repository/GeolocatorRepositoryImpl.dart';
import 'package:transporte_carga_flutter/src/data/repository/UsersRepositoryImpl.dart';
import 'package:transporte_carga_flutter/src/domain/models/AuthResponse.dart';
import 'package:transporte_carga_flutter/src/domain/repository/AuthRepository.dart';
import 'package:transporte_carga_flutter/src/domain/repository/GeolocatorRepository.dart';
import 'package:transporte_carga_flutter/src/domain/repository/UsersRepository.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/auth/AuthUseCases.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/auth/GetUserSessionUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/auth/LoginUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/auth/LogoutUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/auth/RegisterUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/auth/SaveUserSessionUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/geolocator/CreateMarkerUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/geolocator/FindPositionUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/geolocator/GeolocatorUseCases.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/geolocator/GetMarkerUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/geolocator/GetPlacemarkDataUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/users/UpdateUserUseCase.dart';
import 'package:transporte_carga_flutter/src/domain/useCases/users/UsersUseCases.dart';

@module
abstract class AppModule {
  @injectable
  SharefPref get sharefPref => SharefPref();

  @injectable
  Future<String> get token async {
    String token = '';
    final userSession = await sharefPref.read('user');
    if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
    }
    return token;
  }

  @injectable
  AuthService get authService => AuthService();

  @injectable
  UsersService get usersService => UsersService(token);

  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authService, sharefPref);

  @injectable
  UsersRepository get usersRepository => UsersRepositoryImpl(usersService);

  @injectable
  GeolocatorRepository get geolocatorRepository => GeolocatorRepositoryImpl();

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    login: LoginUseCase(authRepository),
    register: RegisterUseCase(authRepository),
    saveUserSession: SaveUserSessionUseCase(authRepository),
    getUserSession: GetUserSessionUseCase(authRepository),
    logout: LogoutUseCase(authRepository),
  );

  @injectable
  UsersUseCases get usersUseCases =>
      UsersUseCases(update: UpdateUserUseCase(usersRepository));

  @injectable
  GeolocatorUseCases get geolocatorUseCases => GeolocatorUseCases(
    findPosition: FindPositionUseCase(geolocatorRepository),
    createMarker: CreateMarkerUseCase(geolocatorRepository),
    getMarker: GetMarkerUseCase(geolocatorRepository),
    getPlacemarkData: GetPlacemarkDataUseCase(geolocatorRepository),
  );
}
