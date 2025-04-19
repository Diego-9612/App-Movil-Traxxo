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
          height: MediaQuery.of(context).size.height,
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
                  SizedBox(height: 30),
                  _text(
                    'TRAXXO',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  _text(
                    'CARGA SEGURA Y A TIEMPO...',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
                  _imageLogo(),
                  _text(
                    'Iniciar Sesión',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomTextField(text: 'Email', icon: Icons.email_outlined),
                  CustomTextField(text: 'Password', icon: Icons.lock_outline, margin: EdgeInsets.only( bottom: 10, top: 10, left: 5, right: 5),),
                  _textRecoverAccount(context),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.2),
                  CustomButton(text: 'Iniciar Sesion'),
                  _textDontHaveAccount(context),
                  Center(
                    child: _iconGmail(),
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _textRecoverAccount(BuildContext context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, 'recover');
          },
          child: Text(
            '¿Olvidaste tu contraseña?',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
          ),
        )
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

  Widget _imageLogo() {
    return Container(
      alignment: Alignment.centerRight,
      child: Image.asset('assets/img/logotraxxo.png', width: 200, height: 200),
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
}
