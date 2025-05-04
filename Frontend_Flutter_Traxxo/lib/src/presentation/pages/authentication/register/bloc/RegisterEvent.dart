import 'package:transporte_carga_flutter/src/domain/models/AuthResponse.dart';
import 'package:transporte_carga_flutter/src/presentation/utils/BlocFormItem.dart';

abstract class RegisterEvent {}

class RegisterInitEvent extends RegisterEvent{}

class NameChanged extends RegisterInitEvent{
  final BlocFormItem name;
  NameChanged({required this.name});
}

class LastnameChanged extends RegisterInitEvent {
  final BlocFormItem lastname;
  LastnameChanged({ required this.lastname });
}

class EmailChanged extends RegisterInitEvent {
  final BlocFormItem email;
  EmailChanged({ required this.email });
}

class PhoneChanged extends RegisterInitEvent {
  final BlocFormItem phone;
  PhoneChanged({ required this.phone });
}

class PasswordChanged extends RegisterInitEvent {
  final BlocFormItem password;
  PasswordChanged({ required this.password });
}

class SaveUserSession extends RegisterInitEvent{
  final AuthResponse authResponse;
  SaveUserSession({ required this.authResponse });
}

class FormSubmit extends RegisterInitEvent{}
class FormReset extends RegisterInitEvent{}


