import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:transporte_carga_flutter/src/domain/models/User.dart';
import 'package:transporte_carga_flutter/src/domain/utils/Resource.dart';
import 'package:transporte_carga_flutter/src/presentation/utils/BlocFormItem.dart';

class ProfileUpdateState extends Equatable {
  final int id;
  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem phone;
  final Resource? response;
  final File? image;
  final GlobalKey<FormState>? formKey;

  ProfileUpdateState({
    this.id = 0,
    this.name = const BlocFormItem(error: 'Ingrese el nombre'),
    this.lastname = const BlocFormItem(error: 'Ingrese el apellido'),
    this.phone = const BlocFormItem(error: 'Ingrese el teléfono'),
    this.response,
    this.image,
    this.formKey,
  });

  toUser() =>
      User(name: name.value, lastname: lastname.value, phone: phone.value);

  ProfileUpdateState copyWith({
    int? id,
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? phone,
    Resource? response,
    File? image,
    GlobalKey<FormState>? formKey,
  }) {
    return ProfileUpdateState(
      id: id ?? this.id,
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      phone: phone ?? this.phone,
      response: response,
      image: image ?? this.image,
      formKey: formKey ?? this.formKey,
    );
  }

  @override
  List<Object?> get props => [id, name, lastname, phone, response, image ,formKey];
}
