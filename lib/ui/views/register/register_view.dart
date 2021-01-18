import 'package:firebase_android/ui/shared/constants.dart';
import 'package:firebase_android/ui/shared/loading.dart';
import 'package:firebase_android/ui/views/register/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RegisterView extends StatelessWidget {
  final Function toggleView;
  RegisterView({this.toggleView});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
          backgroundColor: Colors.orange[100],
          appBar: AppBar(
            backgroundColor: Colors.orange[400],
            elevation: 0.0,
            title: Text('Catering service, sign up'),
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('Sign In'),
                onPressed: () => toggleView(),
              ),
            ],
          ),
          body: _HookForm()),
      viewModelBuilder: () => RegisterViewModel(),
    );
  }
}

// this class will handling our form
class _HookForm extends HookViewModelWidget<RegisterViewModel> {
  @override
  Widget buildViewModelWidget(BuildContext context, RegisterViewModel model) {
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
                      'Congratulations! You were invited. This application will help you place a meal order in advance. You may proceed to register.'),
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
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          model.appStateTrue();
                          dynamic result =
                              await model.registerWithEmailAndPassword(
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
