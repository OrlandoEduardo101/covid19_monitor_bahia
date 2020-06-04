import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import 'auth_repository_interface.dart';

class AuthRepository implements IAuthRepository{


  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<FirebaseUser> getEmailPasswordLogin(String email, String password) async{

    final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
        email:email, password:password)).user;

    return user;

  }

  @override
  Future getFacebookLogin() {
    // TODO: implement getFacebookLogin
    throw UnimplementedError();
  }

  @override
  Future<String> getToken() {
    // TODO: implement getToken
    throw UnimplementedError();
  }

  @override
  Future<FirebaseUser> getUser() {
    return FirebaseAuth.instance.currentUser();
  }

  @override
  Future getLogout() async {
    return await _auth.signOut();
  }

  @override
  Future<FirebaseUser> getGoogleLogin() {
    // TODO: implement getGoogleLogin
    throw UnimplementedError();
  }

}

class GoogleSignInAccount {
}