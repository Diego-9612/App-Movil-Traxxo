// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:transporte_carga_flutter/src/data/dataSource/local/SharefPref.dart'
    as _i129;
import 'package:transporte_carga_flutter/src/data/dataSource/remote/services/AuthService.dart'
    as _i727;
import 'package:transporte_carga_flutter/src/data/dataSource/remote/services/UsersService.dart'
    as _i578;
import 'package:transporte_carga_flutter/src/di/AppModule.dart' as _i644;
import 'package:transporte_carga_flutter/src/domain/repository/AuthRepository.dart'
    as _i557;
import 'package:transporte_carga_flutter/src/domain/repository/UsersRepository.dart'
    as _i88;
import 'package:transporte_carga_flutter/src/domain/useCases/auth/AuthUseCases.dart'
    as _i714;
import 'package:transporte_carga_flutter/src/domain/useCases/users/UsersUseCases.dart'
    as _i1020;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final appModule = _$AppModule();
    gh.factory<_i129.SharefPref>(() => appModule.sharefPref);
    gh.factoryAsync<String>(() => appModule.token);
    gh.factory<_i727.AuthService>(() => appModule.authService);
    gh.factory<_i578.UsersService>(() => appModule.usersService);
    gh.factory<_i557.AuthRepository>(() => appModule.authRepository);
    gh.factory<_i88.UsersRepository>(() => appModule.usersRepository);
    gh.factory<_i714.AuthUseCases>(() => appModule.authUseCases);
    gh.factory<_i1020.UsersUseCases>(() => appModule.usersUseCases);
    return this;
  }
}

class _$AppModule extends _i644.AppModule {}
