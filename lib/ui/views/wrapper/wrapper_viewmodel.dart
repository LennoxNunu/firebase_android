import 'package:firebase_android/app/locator.dart';
import 'package:firebase_android/services/auth.dart';
import 'package:stacked/stacked.dart';

class WrapperViewModel extends StreamViewModel {
  @override
  get stream => locator<AuthService>().user;

  get userLoggedIn => data;
}
