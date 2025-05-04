import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporte_carga_flutter/main.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/client/home/bloc/ClientHomeBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/client/home/bloc/ClientHomeEvent.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/client/home/bloc/ClientHomeState.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/profile/info/ProfileInfoPage.dart';

class ClientHomePage extends StatefulWidget {
  const ClientHomePage({super.key});

  @override
  State<ClientHomePage> createState() => _ClientHomePageState();
}

class _ClientHomePageState extends State<ClientHomePage> {
  List<Widget> pageList = <Widget>[ProfileInfoPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu de Opciones')),
      body: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return pageList[state.pageIndex];
        },
      ),
      drawer: BlocBuilder<ClientHomeBloc, ClientHomeState>(
        builder: (context, state) {
          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color.fromARGB(255, 224, 181, 50), // amber[100]
                        Color.fromARGB(106, 141, 148, 10),
                      ],
                    ),
                  ),
                  child: Text(
                    'Menu del Cliente',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                ListTile(
                  title: Text('Perfil del usuario'),
                  selected: state.pageIndex == 0,
                  onTap: () {
                    context.read<ClientHomeBloc>().add(
                      ChangeDrawerPage(pageIndex: 0),
                    );
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: Text('Cerrar sesion'),
                  onTap: () {
                    context.read<ClientHomeBloc>().add(Logout());
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MyApp()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
