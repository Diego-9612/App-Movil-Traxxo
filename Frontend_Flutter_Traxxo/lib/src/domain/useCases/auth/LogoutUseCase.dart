import 'package:transporte_carga_flutter/src/domain/repository/AuthRepository.dart';

class LogoutUseCase {
  AuthRepository authRepository;

  LogoutUseCase(this.authRepository);

  run() => authRepository.logout();
}