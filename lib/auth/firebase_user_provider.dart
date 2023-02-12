import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class PanditJiFirebaseUser {
  PanditJiFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

PanditJiFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<PanditJiFirebaseUser> panditJiFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<PanditJiFirebaseUser>(
      (user) {
        currentUser = PanditJiFirebaseUser(user);
        return currentUser!;
      },
    );
