import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _userFormFirebase(User? user){
    return user ?? null;
  }

  Stream<User?> get user {

  }



}