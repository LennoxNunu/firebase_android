import 'package:firebase_android/app/locator.dart';
import 'package:firebase_android/services/auth.dart';
import 'package:firebase_android/services/database.dart';
import 'package:stacked/stacked.dart';

class EditFormViewModel extends StreamViewModel {
  // stream of the users document
  String getUid = locator<AuthService>().getUid;

  @override
  get stream => DatabaseService().userData(getUid);

  get userData => data;

  final List<String> sugars = ['0', '1', '2', '3', '4'];
  final List<int> strengths = [100, 200, 300, 400, 500, 600, 700, 800, 900];
  // form values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

// controls the state while the user decides the number of sugar
  String get currentName => _currentName;

  void nameOnChange(val) {
    _currentName = val;
    notifyListeners();
  }

// validate the name on the form
  String nameValidator(val) {
    return val.isEmpty ? 'Please enter a name' : null;
  }

// controls the state while the user decides the number of sugar
  String get currentSugars => _currentSugars;

  void sugarsOnChange(val) {
    _currentSugars = val;
    notifyListeners();
  }

  int get currentStrength => _currentStrength;

  void strengthOnChange(val) {
    _currentStrength = val.round();
    notifyListeners();
  }

  void updateUserData() async {
    await DatabaseService(uid: getUid).updateUserData(
        _currentName ?? data['name'], _currentMeal ?? data['meal']);
  }
// Setup our app the way we want it to behave

  String _currentMeal;

  String get meal => _currentMeal;

  void mealchoice({String choosenMeal}) {
    _currentMeal = choosenMeal;
    notifyListeners();
  }
}
