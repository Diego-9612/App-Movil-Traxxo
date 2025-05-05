import 'package:equatable/equatable.dart';
import 'package:transporte_carga_flutter/src/domain/models/User.dart';

class ProfileInfoState extends Equatable {

  final User? user;

  ProfileInfoState({this.user});

  ProfileInfoState copyWith({
    User? user
  }) {
    return ProfileInfoState(
      user: user
    );
  }

  @override
  List<Object?> get props => [user];

}
