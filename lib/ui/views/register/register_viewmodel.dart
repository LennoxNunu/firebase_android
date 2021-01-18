import 'package:firebase_android/app/locator.dart';
import 'package:firebase_android/services/auth.dart';
import 'package:stacked/stacked.dart';

class RegisterViewModel extends BaseViewModel {
  final AuthService _auth = locator<AuthService>();
  String capturederror = ' ';
  bool appState = false;

// validates the users email address
  String emailValidate(val) {
    return val.isEmpty ? 'Enter an email' : null;
  }

// validates the users password
  String passwordValidate(val) {
    return val.length < 6 ? 'Enter a password 6+ chars long' : null;
  }

//register with email and password to firebase_auth
  registerWithEmailAndPassword(email, password) async {
    await _auth.registerWithEmailAndPassword(email, password);
  }

  // controlling the busy state of the app
  void appStateTrue() {
    appState = true;
    notifyListeners();
  }

  void appStateFalse() {
    appState = false;
    notifyListeners();
  }

//captures error from firebase_auth
  void display() {
    capturederror = 'Please supply a valid email or email already in use';
    notifyListeners();
  }

  // signin user to firebase_auth
  dynamic signInAnon() async {
    dynamic result = await _auth.signInAnon();
    if (result == null) {
      print('error signing in');
    } else {
      print('signed in');
      print(result.uid);
    }
  }
}
