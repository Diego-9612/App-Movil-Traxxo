import 'package:flutter/material.dart';
import 'package:transporte_carga_flutter/src/domain/models/User.dart';

class ProfileInfoContent extends StatelessWidget {

  User? user;

  ProfileInfoContent(this.user);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            _headerProfile(context),
            Spacer(),
            _actionProfile('EDITAR PERFIL', Icons.edit, (){
              Navigator.pushNamed(context, 'profile/update', arguments: user);
            }),
            _actionProfile('CERRAR SESION', Icons.settings_power, (){}),
            SizedBox(height: 35),
          ],
        ),
        _cardUserInfo(context),
      ],
    );
  }

  Widget _cardUserInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 100),
      width: MediaQuery.of(context).size.width,
      height: 250,
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Column(
          children: [
            Container(
              width: 100,
              margin: EdgeInsets.only(top: 20, bottom: 15),
              child: AspectRatio(
                aspectRatio: 1,
                child: ClipOval(
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/img/user_image.png',
                    image:
                        'https://static.vecteezy.com/system/resources/previews/000/439/863/non_2x/vector-users-icon.jpg',
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  ),
                ),
              ),
            ),
            Text(
              '${user?.name} ${user?.lastname}' ?? '',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              user?.email ?? '',
              style: TextStyle(color: Colors.grey[700]),
            ),
            Text(user?.phone ?? '', style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }

  Widget _actionProfile(String option, IconData icon, Function() function) {
    return GestureDetector(
      onTap: (){
        function();
      },
      child: Container(
        margin: EdgeInsets.only(left: 20, right: 20, top: 10),
        child: ListTile(
          title: Text(option, style: TextStyle(fontWeight: FontWeight.bold)),
          leading: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color.fromARGB(255, 60, 60, 60),
                  Color.fromARGB(106, 20, 20, 20),
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Icon(icon, color: Colors.amber),
          ),
        ),
      ),
    );
  }

  Widget _headerProfile(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 40),
      height: MediaQuery.of(context).size.height * 0.35,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 60, 60, 60),
            Color.fromARGB(106, 20, 20, 20),
          ],
        ),
      ),
      child: Text(
        'PERFIL DE USUARIO',
        style: TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
