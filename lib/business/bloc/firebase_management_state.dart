import 'package:equatable/equatable.dart';
import 'package:flutter/rendering.dart';

abstract class FirebaseManagementState extends Equatable {
  const FirebaseManagementState();

  @override
  List<Object> get props => [];
}

class Uninitialized extends FirebaseManagementState {}

class Authenticated extends FirebaseManagementState{
  final String displayName;

  const Authenticated(this.displayName);

  @override 
  List<Object> get props => [displayName];

  @override
  String toString() => 'Authenticated {displayName : $displayName}';  
}

class Unauthenticated extends FirebaseManagementState{}
