import 'package:firebase_android/ui/views/authenticate/authenticate_view.dart';
import 'package:firebase_android/ui/views/home/home_view.dart';
import 'package:firebase_android/ui/views/wrapper/wrapper_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class WrapperView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<WrapperViewModel>.reactive(
      builder: (context, model, child) {
        // return either the Home or Authenticate widget
        if (model.userLoggedIn == null) {
          return AuthenticateView();
        } else {
          return HomeView();
        }
      },
      viewModelBuilder: () => WrapperViewModel(),
    );
  }
}
