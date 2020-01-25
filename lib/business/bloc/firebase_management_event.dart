import 'package:equatable/equatable.dart';

abstract class FirebaseManagementEvent extends Equatable {
  @override
  List<Object> get props => [];

}


class AppStarted extends FirebaseManagementEvent{}
class SignedIn extends FirebaseManagementEvent{}
class SignedOut extends FirebaseManagementEvent{}