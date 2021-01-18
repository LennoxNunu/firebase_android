import 'package:firebase_android/app/locator.dart';
import 'package:firebase_android/services/auth.dart';
import 'package:stacked/stacked.dart';

class SignInViewModel extends BaseViewModel {
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

//sign in with email and password to firebase_auth
  Future<dynamic> signInWithEmailAndPassword(email, password) async {
    await _auth.signInWithEmailAndPassword(email, password);
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
    capturederror =
        'could not sign in with those credentials or check internet connection ';
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

// class AddFileViewModel extends BaseViewModel {
//   Individual positionOnRegisteredlist;
//   final _formKey = GlobalKey<FormState>();
//   final _navigationService = locator<NavigationService>();
//   final _myDatabase = locator<MyDatabase>();

//   int _individualsId;
//   String _diagnosis;
//   var _appointment = DateTime.now();
//   String _treatment;
//   String _bloodPressure;
//   int _pulse;
//   int _respirationRate;
//   int _bodyTemperature;
//   int _weight;

//   get formKey => _formKey;

//   individualsId(int idNumber) {
//     _individualsId = idNumber;
//   }

//   void diagnosisOnsaved(String input) {
//     _diagnosis = input;
//   }

//   void treatmentOnsaved(String input) {
//     _treatment = input;
//   }

//   void bloodPressureOnsaved(String input) {
//     _bloodPressure = input;
//   }

//   String pulseValidator(String input) {
//     return input.length > 2 ? 'Enter a two digit number' : null;
//   }

//   void pulseOnsaved(String input) {
//     _pulse = int.tryParse(input);
//   }

//   String respirationRateValidator(String input) {
//     return input.length > 2 ? 'Enter a two digit number' : null;
//   }

//   void respirationRateOnsaved(String input) {
//     _respirationRate = int.tryParse(input);
//   }

//   String bodyTemperatureValidator(String input) {
//     return input.length > 2 ? 'Enter a two digit number' : null;
//   }

//   void bodyTemperatureOnsaved(String input) {
//     _bodyTemperature = int.tryParse(input);
//   }

//   String weightValidator(String input) {
//     return input.length > 2 ? 'Enter a two digit number' : null;
//   }

//   void weightOnsaved(String input) {
//     _weight = int.tryParse(input);
//   }

// // navigate to Edit_Info_View
//   editprofile() {
//     _navigationService.navigateTo(Routes.editInfoView,
//         arguments: EditInfoViewArguments(
//             positionOnRegisteredlist: positionOnRegisteredlist));

//     print(positionOnRegisteredlist.id);
//   }

// // submit the form in
//   void submit() async {
//     if (_formKey.currentState.validate()) {
//       _formKey.currentState.save();

//       IndividualsDetail individualsDetail = IndividualsDetail(
//         //The idPrimary is auto incrementing key and handled by database.
//         individualsId: _individualsId,
//         appointment: _appointment,
//         diagnosis: _diagnosis,
//         treatment: _treatment,
//         pulse: _pulse,
//         bloodPressure: _bloodPressure,
//         respirationRate: _respirationRate,
//         bodyTemperature: _bodyTemperature,
//         weight: _weight,
//       );

//       await _myDatabase.insertIndividualsDetails(individualsDetail);

//       _navigationService.navigateTo(Routes.fileListView,
//           arguments: FileListViewArguments(
//             individualTransfer: positionOnRegisteredlist,
//             individualsId: individualsDetail.individualsId,
//           ));
//     }
//   }

//   openFiles() {
//     _navigationService.navigateTo(Routes.fileListView,
//         arguments: FileListViewArguments(
//           individualTransfer: positionOnRegisteredlist,
//           individualsId: positionOnRegisteredlist.id,
//         ));
//   }

//   ///navigate back to Welcome_View
//   Future<dynamic> home() {
//     return _navigationService.navigateTo(Routes.welcomeView);
//   }
// }
