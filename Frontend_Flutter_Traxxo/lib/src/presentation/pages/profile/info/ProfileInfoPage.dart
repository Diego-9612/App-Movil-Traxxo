import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/profile/info/ProfileInfoContent.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoBloc.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/profile/info/bloc/ProfileInfoState.dart';

class ProfileInfoPage extends StatefulWidget {
  const ProfileInfoPage({super.key});

  @override
  State<ProfileInfoPage> createState() => _ProfileInfoPageState();
}

class _ProfileInfoPageState extends State<ProfileInfoPage> {

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: BlocBuilder<ProfileInfoBloc, ProfileInfoState>(
        builder: (context, state) {
          return ProfileInfoContent(state.user);
        },
      ),
    );
  }
}
