import 'package:equatable/equatable.dart';

abstract class FirebaseManagementState extends Equatable {
  const FirebaseManagementState();
}

class InitialFirebaseManagementState extends FirebaseManagementState {
  @override
  List<Object> get props => [];
}
