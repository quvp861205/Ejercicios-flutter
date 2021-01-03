import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/repository/auth_repository.dart';

class UserBloc implements Bloc {

  final _auth_repository = AuthRepository();

  //Flujo de datos (Stream)
  //Stream de Firebase
 // Stream<FirebaseUser> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;
  // ignore: deprecated_member_use
  Stream<User> streamFirebase = FirebaseAuth.instance.onAuthStateChanged;

  // ignore: deprecated_member_use
  Stream<User> get authStatus => streamFirebase;

  //Casos de uso
  //1. Hacer SignIn a la aplicacion Google
  // ignore: deprecated_member_use
  Future<User> signIn() {
    return _auth_repository.signInFirebase();
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}