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
          color: Colors.white,
          //padding: EdgeInsets.only(left: 12),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30),
                _textWelcome(
                  'TRAXXO',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
                _textWelcome(
                  'CARGA SEGURA Y A TIEMPO...',
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                _imageLogo(),
                _textWelcome(
                  'Iniciar Sesión',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                CustomTextField(text: 'Email', icon: Icons.email_outlined),
                CustomTextField(text: 'Password', icon: Icons.lock_outline),
                SizedBox(height: 10),
                Center(
                  child: Center(
                    child: _textWelcome(
                      '¿Olvidaste tu Contraseña?',
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
                CustomButton(text: 'Iniciar Sesion'),
                _textDontHaveAccount(context),
                SizedBox(height: 10),
                Center(
                  child: _iconGmail(),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _textDontHaveAccount(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta?',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        SizedBox(width: 7),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'register');
          },
          child: Text(
            'Registrate',
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

  Widget _textWelcome(
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

  Widget _imageLogo() {
    return Container(
      alignment: Alignment.centerRight,
      child: Image.asset('assets/img/logotraxxo.png', width: 200, height: 200),
    );
  }

  Widget _iconGmail() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Center(
        child: Icon(
          Icons.email, // sin color personalizado
          size: 30,
        ),
      ),
    );
  }
}
