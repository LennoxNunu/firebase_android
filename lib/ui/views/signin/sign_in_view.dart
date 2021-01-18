import 'package:firebase_android/ui/shared/constants.dart';
import 'package:firebase_android/ui/shared/loading.dart';
import 'package:firebase_android/ui/views/signin/sign_in_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SignInView extends StatelessWidget {
  final Function toggleView;
  SignInView({this.toggleView});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignInViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.orange[100],
          appBar: AppBar(
            backgroundColor: Colors.orange[400],
            elevation: 0.0,
            title: Text('Catering service, sign in'),
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Register'),
                onPressed: () => toggleView(),
              ),
            ],
          ),
          body: _HookForm()),
      viewModelBuilder: () => SignInViewModel(),
    );
  }
}

// this class will handling our form
class _HookForm extends HookViewModelWidget<SignInViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, SignInViewModel model) {
    var _emailController = useTextEditingController();
    var _passwordController = useTextEditingController();
    final _formKey = GlobalKey<FormState>();

    return model.appState
        ? Loading()
        : Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: Form(
              key: _formKey,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Text(
                      'Congratulations! You were invited. This application will help you place a meal order in advance. You may proceed to signin.'),
                  SizedBox(height: 20.0),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: 'email'),
                    validator: (val) => model.emailValidate(val),
                    controller: _emailController,
                  ),
                  SizedBox(height: 20.0),
                  TextFormField(
                    obscureText: true,
                    decoration:
                        textInputDecoration.copyWith(hintText: 'password'),
                    validator: (val) => model.passwordValidate(val),
                    controller: _passwordController,
                  ),
                  SizedBox(height: 20.0),
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Sign In',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          model.appStateTrue();
                          dynamic result =
                              await model.signInWithEmailAndPassword(
                                  _emailController.text,
                                  _passwordController.text);
                          if (result == null) {
                            model.appStateFalse();
                            model.display();
                          }
                        }
                      }),
                  SizedBox(height: 12.0),
                  Text(
                    model.capturederror,
                    style: TextStyle(color: Colors.red, fontSize: 14.0),
                  )
                ],
              ),
            ),
          );
  }
}
