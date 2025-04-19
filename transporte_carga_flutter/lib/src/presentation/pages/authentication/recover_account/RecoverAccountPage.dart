import 'package:flutter/material.dart';
import 'package:transporte_carga_flutter/src/presentation/pages/authentication/recover_account/RecoverAccountContent.dart';


class RecoverAccountPage extends StatefulWidget {
  const RecoverAccountPage({super.key});

  @override
  State<RecoverAccountPage> createState() => _RecoverAccountPageState();
}

class _RecoverAccountPageState extends State<RecoverAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RecoverAccountContent(),
    );
  }
}