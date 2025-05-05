import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporte_carga_flutter/src/domain/models/User.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateState.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/profile/update/bloc/ProfileUpdateEvent.dart';
import 'package:transporte_carga_flutter/src/presentation/utils/BlocFormItem.dart';
import 'package:transporte_carga_flutter/src/presentation/widgets/CustomIconBack.dart';
import 'package:transporte_carga_flutter/src/presentation/widgets/CustomTextField.dart';

class ProfileUpdateContent extends StatelessWidget {
  User? user;
  ProfileUpdateState state;

  ProfileUpdateContent(this.state, this.user);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: state.formKey,
      child: Stack(
        children: [
          Column(
            children: [
              _headerProfile(context),
              Spacer(),
              _actionProfile(context, 'ACTUALIZAR USUARIO', Icons.check),
              SizedBox(height: 35),
            ],
          ),
          _cardUserInfo(context),
          CustomIconBack(margin: EdgeInsets.only(top: 60, left: 30)),
        ],
      ),
    );
  }

  Widget _cardUserInfo(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 150),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.5,
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
                    image: 'assets/img/user_image.png',
                    fit: BoxFit.cover,
                    fadeInDuration: Duration(seconds: 1),
                  ),
                ),
              ),
            ),
            CustomTextField(
              text: 'Nombre',
              icon: Icons.person,
              backgroundColor: Colors.grey[200]!,
              margin: EdgeInsets.only(left: 30, right: 30, top: 15),
              initialValue: user?.name,
              onChanged: (text) {
                context.read<ProfileUpdateBloc>().add(
                  NameChanged(name: BlocFormItem(value: text)),
                );
              },
              validator: (value) {
                return state.name.error;
              },
            ),
            CustomTextField(
              text: 'Apellido',
              icon: Icons.person_outline,
              backgroundColor: Colors.grey[200]!,
              margin: EdgeInsets.only(left: 30, right: 30, top: 15),
              initialValue: user?.lastname,
              onChanged: (text) {
                context.read<ProfileUpdateBloc>().add(
                  LastNameChanged(lastname: BlocFormItem(value: text)),
                );
              },
              validator: (value) {
                return state.lastname.error;
              },
            ),
            CustomTextField(
              text: 'Telefono',
              icon: Icons.phone,
              backgroundColor: Colors.grey[200]!,
              margin: EdgeInsets.only(left: 30, right: 30, top: 15),
              initialValue: user?.phone,
              onChanged: (text) {
                context.read<ProfileUpdateBloc>().add(
                  PhoneChanged(phone: BlocFormItem(value: text)),
                );
              },
              validator: (value) {
                return state.phone.error;
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionProfile(BuildContext context, String option, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (state.formKey!.currentState != null) {
          if (state.formKey!.currentState!.validate()) {
            context.read<ProfileUpdateBloc>().add(FormSubmit());
          }
        }
        else{
          context.read<ProfileUpdateBloc>().add(FormSubmit());
        }
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
      padding: EdgeInsets.only(top: 70),
      height: MediaQuery.of(context).size.height * 0.4,
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
        'ACTUALIZAR PERFIL',
        style: TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
