import 'package:transporte_carga_flutter/src/domain/models/User.dart';
import 'package:transporte_carga_flutter/src/presentation/utils/BlocFormItem.dart';

abstract class ProfileUpdateEvent {}

class ProfileUpdateInitEvent extends ProfileUpdateEvent{
  final User? user;
  ProfileUpdateInitEvent({ required this.user});
}

class NameChanged extends ProfileUpdateEvent{
  final BlocFormItem name;
  NameChanged({ required this.name});
}

class LastNameChanged extends ProfileUpdateEvent{
  final BlocFormItem lastname;
  LastNameChanged({ required this.lastname});
}

class PhoneChanged extends ProfileUpdateEvent{
  final BlocFormItem phone;
  PhoneChanged({ required this.phone});
}

class UpdateUserSession extends ProfileUpdateEvent{
  final User user;
  UpdateUserSession({required this.user});
}

class FormSubmit extends ProfileUpdateEvent{}