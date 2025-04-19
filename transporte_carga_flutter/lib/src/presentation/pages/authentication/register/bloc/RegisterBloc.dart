import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/bloc/RegisterEvent.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/bloc/RegisterState.dart';
import 'package:transporte_carga_flutter/src/presentation/utils/BlocFormItem.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final formKey = GlobalKey<FormState>();

  RegisterBloc() : super(RegisterState()) {
    on<RegisterInitEvent>((event, emit) {
      emit(state.copyWith(formKey: formKey));
    });

    on<NameChanged>((event, emit) {
      emit(
        state.copyWith(
          name: BlocFormItem(
            value: event.name.value,
            error: event.name.value.isEmpty ? 'Ingresa el nombre' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<LastnameChanged>((event, emit) {
      emit(
        state.copyWith(
          lastname: BlocFormItem(
            value: event.lastname.value,
            error: event.lastname.value.isEmpty ? 'Ingresa el Apellido' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<EmailChanged>((event, emit) {
      emit(
        state.copyWith(
          email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isEmpty ? 'Ingresa el email' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PhoneChanged>((event, emit) {
      emit(
        state.copyWith(
          phone: BlocFormItem(
            value: event.phone.value,
            error:
                event.phone.value.isEmpty ? 'Ingresa tu telefono movil' : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<PasswordChanged>((event, emit) {
      emit(
        state.copyWith(
          password: BlocFormItem(
            value: event.password.value,
            error:
                event.password.value.isEmpty
                    ? 'Ingresa una contraseña'
                    : event.password.value.length < 6
                    ? 'Mas de 6 caracteres'
                    : null,
          ),
          formKey: formKey,
        ),
      );
    });

    on<FormSubmit>((event, emit) {
      print('Name: ${state.name.value}');
      print('LastName: ${state.lastname.value}');
      print('email: ${state.email.value}');
      print('phone: ${state.phone.value}');
      print('password: ${state.password.value}');
    });

    on<FormReset>((event, emit) {
      state.formKey?.currentState?.reset();
    });
  }
}
