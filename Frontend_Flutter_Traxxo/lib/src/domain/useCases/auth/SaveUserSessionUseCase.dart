import 'package:transporte_carga_flutter/src/domain/models/AuthResponse.dart';
import 'package:transporte_carga_flutter/src/domain/repository/AuthRepository.dart';

class SaveUserSessionUseCase {

  AuthRepository authRepository;
  SaveUserSessionUseCase(this.authRepository);

  run(AuthResponse authResponse) => authRepository.saveUserSession(authResponse);

}
