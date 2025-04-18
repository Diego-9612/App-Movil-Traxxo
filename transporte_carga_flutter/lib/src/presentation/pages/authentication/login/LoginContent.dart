import 'package:flutter/material.dart';
import 'package:transporte_carga_flutter/src/presentation/widgets/CustomButton.dart';
import 'package:transporte_carga_flutter/src/presentation/widgets/CustomTextField.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.blue,
          padding: EdgeInsets.only(left: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _textLoginRotated(),
              SizedBox(height: 50),
              _textRegisterRotated(),
              SizedBox(height: 90),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 60, bottom: 20),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color.fromARGB(255, 14, 29, 166),
                Color.fromARGB(255, 30, 112, 227),
              ],
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              bottomLeft: Radius.circular(35),
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(bottom: 15, left: 25, right: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 50),
                _textWelcome('Welcome'),
                _textWelcome('Back...'),
                _imageLogo(),
                _textLogin(),

                CustomTextField(text: 'Email', icon: Icons.email_outlined),
                CustomTextField(text: 'Password', icon: Icons.lock_outline),
                Spacer(),
                CustomButton(text: 'Iniciar Sesion'),
                _textDontHaveAccount(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'No tienes cuenta?',
          style: TextStyle(color: Colors.grey[100], fontSize: 17),
        ),
        SizedBox(width: 7),
        Text(
          'Registrate',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
      ],
    );
  }

  Widget _textLogin() {
    return Text('Log in', style: TextStyle(fontSize: 25, color: Colors.white));
  }

  Widget _textWelcome(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 30,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _imageLogo() {
    return Container(
      alignment: Alignment.centerRight,
      child: Image.asset('assets/img/car.png', width: 150, height: 150),
    );
  }

  Widget _textLoginRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Login',
        style: TextStyle(
          color: Colors.white,
          fontSize: 27,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _textRegisterRotated() {
    return RotatedBox(
      quarterTurns: 1,
      child: Text(
        'Registro',
        style: TextStyle(color: Colors.white, fontSize: 23),
      ),
    );
  }
}
