import 'package:flutter/material.dart';
import 'package:transporte_carga_flutter/src/presentation/widgets/CustomButton.dart';
import 'package:transporte_carga_flutter/src/presentation/widgets/CustomTextFieldOpacity.dart';

class RecoverAccountContent extends StatelessWidget {
  const RecoverAccountContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                Color.fromARGB(255, 255, 255, 255,),
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
                    _text(
                    'Recupera tu cuenta',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  _text(
                    'Introduce tu email o numero movil para buscar tu cuenta',
                    fontSize: 15,
                    fontWeight: FontWeight.normal
                  ),
                    CustomTextFieldOpacity(
                      text: 'Email o numero movil',
                      icon: Icons.person_outlined
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.35),
                    CustomButton(
                      text: 'Buscar',
                      ),
                      _textAlreadyHaveAccount(context),
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
  
  


  Widget _imageBanner(){
    return Container(
      margin: EdgeInsets.only(top: 10),
      alignment: Alignment.center,
      child: Image.asset(
        'assets/img/logotraxxo.png',
        width: 200,
        height: 200,
      ),
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
            Navigator.pushNamed(context, 'login');
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