import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CowriterFirebaseUser {
  CowriterFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

CowriterFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<CowriterFirebaseUser> cowriterFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<CowriterFirebaseUser>(
      (user) {
        currentUser = CowriterFirebaseUser(user);
        return currentUser!;
      },
    );
