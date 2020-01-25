import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:chat/business/repository/user_repository.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';

class FirebaseManagementBloc extends Bloc<FirebaseManagementEvent, FirebaseManagementState> {
  final UserRepository _userRepository;
  
  FirebaseManagementBloc({@required UserRepository userRepository}) : assert(userRepository != null),
  _userRepository =  userRepository;
  
  @override
  FirebaseManagementState get initialState => Uninitialized();

  @override
  Stream<FirebaseManagementState> mapEventToState(
    FirebaseManagementEvent event,
  ) async* {
    if (event is AppStarted){
      yield* appStartedtoState();
    } else if (event is SignedIn){
      yield* signedIntoState();
    }else if (event is SignedOut){
      yield* signedOuttoState();
    }
  }

  Stream<FirebaseManagementState> appStartedtoState() async*{
    try{
      final isin = await _userRepository.isSignedin();
      if (isin){
        final name = await _userRepository.getUser();
        yield Authenticated(name);
      }else{
        yield Unauthenticated();
      }
    }catch(_){
      yield Unauthenticated();
    }
  }

  Stream<FirebaseManagementState> signedIntoState() async*{
    yield Authenticated(await _userRepository.getUser());
  }

  Stream<FirebaseManagementState> signedOuttoState() async*{
    yield Unauthenticated();
    await _userRepository.signout();
  }
}
