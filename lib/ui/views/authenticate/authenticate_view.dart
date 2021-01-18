import 'package:firebase_android/ui/views/authenticate/authenticate_viewmodel.dart';
import 'package:firebase_android/ui/views/register/register_view.dart';
import 'package:firebase_android/ui/views/signin/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AuthenticateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AuthenticateViewModel>.reactive(
      builder: (context, model, child) => Container(
        child: model.showSignIn
            ? SignInView(toggleView: model.toggleView)
            : RegisterView(toggleView: model.toggleView),
      ),
      viewModelBuilder: () => AuthenticateViewModel(),
    );
  }
}
