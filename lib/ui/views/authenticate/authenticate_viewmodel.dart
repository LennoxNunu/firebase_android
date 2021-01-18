import 'package:stacked/stacked.dart';

class AuthenticateViewModel extends BaseViewModel {
  bool showSignIn = true;

  void toggleView() {
    //print(showSignIn.toString());
    showSignIn = !showSignIn;
    notifyListeners();
  }
}
