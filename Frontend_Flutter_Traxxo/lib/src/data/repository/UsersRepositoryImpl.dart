import 'dart:io';

import 'package:transporte_carga_flutter/src/data/dataSource/remote/services/UsersService.dart';
import 'package:transporte_carga_flutter/src/domain/models/User.dart';
import 'package:transporte_carga_flutter/src/domain/repository/UsersRepository.dart';
import 'package:transporte_carga_flutter/src/domain/utils/Resource.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersService usersService;

  UsersRepositoryImpl(this.usersService);

  @override
  Future<Resource<User>> update(int id, User user, File? file) {
    if (file == null) {
      return usersService.update(id, user);
    } else {
      return usersService.updateImage(id, user, file);
    }
  }
}
