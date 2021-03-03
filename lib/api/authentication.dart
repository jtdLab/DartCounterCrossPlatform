import 'package:dart_counter/app_errors.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  AuthenticationService() : this._firebaseAuth = FirebaseAuth.instance;

  Stream<User> get authStateChanged => _firebaseAuth.authStateChanges();

  Future<void> signIn({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      print("${e.message} ${e.code}");
      if (e.code == 'network-request-failed') {
        throw NetworkError();
      } else {
        throw InvalidEmailAddressOrPasswordError();
      }
    }
  }

  Future<void> resetPassword({String email}) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      print("${e.message} ${e.code}");
      if (e.code == 'network-request-failed') {
        throw NetworkError();
      } else {
        // TODO map errors
        throw InvalidEmailAddressError();
      }
    }
  }

  Future<void> signUp({String email, String password}) async {
    try {
      await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      print("${e.message} ${e.code}");
      if (e.code == 'network-request-failed') {
        throw NetworkError();
      } else {
        throw EmailAddressAlreadyInUseError();
      }
    }
  }

  Future<dynamic> signInFacebook() {
    // TODO implement
  }

  Future<dynamic> signInGoogle() {
    // TODO implement
  }

  Future<dynamic> signInInstagram() {
    // TODO implement
  }

  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }
}
