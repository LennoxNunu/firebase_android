import 'package:firebase_android/app/locator.dart';
import 'package:firebase_android/services/auth.dart';
import 'package:stacked/stacked.dart';

class HomeViewModel extends BaseViewModel {
  final AuthService _auth = locator<AuthService>();

// sign user out of firebase auth
  signOut() async {
    await _auth.signOut();
  }
}
