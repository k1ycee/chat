import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class FirebaseManagementBloc extends Bloc<FirebaseManagementEvent, FirebaseManagementState> {
  @override
  FirebaseManagementState get initialState => InitialFirebaseManagementState();

  @override
  Stream<FirebaseManagementState> mapEventToState(
    FirebaseManagementEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
