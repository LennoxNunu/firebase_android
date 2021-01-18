import 'package:firebase_android/services/database.dart';
import 'package:stacked/stacked.dart';

// class BrewListViewModel extends BaseViewModel {}

class CateringListViewModel extends StreamViewModel {
  bool appstate = true;

  @override
  get stream => DatabaseService().caterings;

  get caterings => data;
}
