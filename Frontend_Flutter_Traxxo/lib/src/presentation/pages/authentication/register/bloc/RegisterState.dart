import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:transporte_carga_flutter/src/domain/models/User.dart';
import 'package:transporte_carga_flutter/src/domain/utils/Resource.dart';
import 'package:transporte_carga_flutter/src/presentation/utils/BlocFormItem.dart';

class RegisterState extends Equatable {
  final BlocFormItem name;
  final BlocFormItem lastname;
  final BlocFormItem email;
  final BlocFormItem phone;
  final BlocFormItem password;
  final GlobalKey<FormState>? formKey;
  final Resource? response;

  toUser() => User(
    name: name.value,
    lastname: lastname.value,
    email: email.value,
    phone: phone.value,
    password: password.value,
    );

  const RegisterState({
    this.name = const BlocFormItem(error: 'Ingresa el nombre'),
    this.lastname = const BlocFormItem(error: 'Ingresa el apellido'),
    this.email = const BlocFormItem(error: 'Ingresa el email'),
    this.phone = const BlocFormItem(error: 'Ingresa el telefono'),
    this.password = const BlocFormItem(error: 'Ingresa el password'),
    this.formKey,
    this.response
  });

  RegisterState copyWith({
    BlocFormItem? name,
    BlocFormItem? lastname,
    BlocFormItem? email,
    BlocFormItem? phone,
    BlocFormItem? password,
    BlocFormItem? confirmPassword,
    GlobalKey<FormState>? formKey,
    Resource? response
  }) {
    return RegisterState(
      name: name ?? this.name,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      formKey: formKey,
      response: response
    );
  }

  @override
  List<Object?> get props => [name, lastname, email, phone, password, response];
}
