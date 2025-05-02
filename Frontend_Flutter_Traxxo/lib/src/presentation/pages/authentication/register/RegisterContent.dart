import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/bloc/RegisterBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/bloc/RegisterEvent.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/register/bloc/RegisterState.dart';
import 'package:transporte_carga_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:transporte_carga_flutter/src/presentation/widgets/CustomButton.dart';
import 'package:transporte_carga_flutter/src/presentation/widgets/CustomTextFieldOpacity.dart';

class RegisterContent extends StatelessWidget {
  RegisterState? state;

  RegisterContent(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state?.formKey,
      child: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 40, bottom: 40, right: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 255, 255, 255),
                  Color.fromARGB(255, 255, 255, 255),
                ],
              ),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black, width: 0.5),
            ),
            child: Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _imageBanner(),
                    _text('Registro', fontSize: 20, fontWeight: FontWeight.bold),
                    CustomTextFieldOpacity(
                      text: 'Nombre',
                      icon: Icons.person_outlined,
                      onChanged: (text) {
                        context.read<RegisterBloc>().add(
                          NameChanged(name: BlocFormItem(value: text)),
                        );
                      },
                      validator: (value) {
                        return state?.name.error;
                      },
                    ),
                    CustomTextFieldOpacity(
                      text: 'Apellidos',
                      icon: Icons.person_2_outlined,
                      onChanged: (text) {
                        context.read<RegisterBloc>().add(
                          LastnameChanged(lastname: BlocFormItem(value: text)),
                        );
                      },
                      validator: (value) {
                        return state?.lastname.error;
                      },
                    ),
                    CustomTextFieldOpacity(
                      text: 'Email',
                      icon: Icons.email_outlined,
                      onChanged: (text) {
                        context.read<RegisterBloc>().add(
                          EmailChanged(email: BlocFormItem(value: text)),
                        );
                      },
                      validator: (value) {
                        return state?.email.error;
                      },
                    ),
                    CustomTextFieldOpacity(
                      text: 'Telefono',
                      icon: Icons.phone_outlined,
                      onChanged: (text) {
                        context.read<RegisterBloc>().add(
                          PhoneChanged(phone: BlocFormItem(value: text)),
                        );
                      },
                      validator: (value) {
                        return state?.phone.error;
                      },
                    ),
                    CustomTextFieldOpacity(
                      text: 'Contraseña',
                      icon: Icons.lock_outline,
                      onChanged: (text) {
                        context.read<RegisterBloc>().add(
                          PasswordChanged(password: BlocFormItem(value: text)),
                        );
                      },
                      validator: (value) {
                        return state?.password.error;
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                    CustomButton(
                      onPressed: () {
                        if (state!.formKey!.currentState!.validate()) {
                          context.read<RegisterBloc>().add(FormSubmit());
                          context.read<RegisterBloc>().add(FormReset());
                        }
                      },
                      text: 'Crear Usuario',
                    ),
                    _textAlreadyHaveAccount(context),
                    Center(child: _iconGmail()),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconGmail() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black, width: 0.5),
      ),
      child: Center(
        child: Icon(
          Icons.email, // sin color personalizado
          size: 30,
        ),
      ),
    );
  }

  Widget _text(
    String text, {
    double fontSize = 24,
    FontWeight fontWeight = FontWeight.bold,
    Color color = Colors.black,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  /*
  Widget _imageBackground(BuildContext context){
    return Container(
      alignment: Alignment.bottomCenter,
      margin: EdgeInsets.only(bottom: 50),
      child: Image.asset(
        'assets/img/destination.png',
        width: MediaQuery.of(context).size.width * 0.6,
        height: MediaQuery.of(context).size.height * 0.4,
        opacity: AlwaysStoppedAnimation(0.3),
      ),
    );
  }
  */

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Image.asset('assets/img/logotraxxo.png', width: 200, height: 200),
    );
  }

  Widget _textAlreadyHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿Ya tienes cuenta?',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        SizedBox(width: 7),
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text(
            'Inicia Sesión',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
