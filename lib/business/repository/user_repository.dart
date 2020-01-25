import 'package:firebase_auth/firebase_auth.dart';

class UserRepository{
  final FirebaseAuth _auth;

  UserRepository({FirebaseAuth auth}) : _auth = auth ?? FirebaseAuth.instance;

  Future<void> signinfirebase(String email , String password) async{
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  Future<void> signupfirebase(String email , String password) async{
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password
    );
  }

  Future<void> signout() async{
    return Future.wait([
      _auth.signOut()
    ]);
  } 

  Future<bool> isSignedin() async{
    final currentUser = await _auth.currentUser();
    return currentUser != null;
  }

  Future<String> getUser() async{
    return (await _auth.currentUser()).email;
  }
}