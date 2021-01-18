import 'package:firebase_android/ui/shared/constants.dart';
import 'package:firebase_android/ui/shared/loading.dart';
import 'package:firebase_android/ui/views/editform/edit_form_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class EditFormView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EditFormViewModel>.reactive(
      builder: (context, model, child) {
        if (model.userData == null) {
          return Loading();
        } else {
          return ListView(children: <Widget>[
            Form(
              //  key: _formKeyone,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30.0),
                  Text(
                    'Welcome...,Make your meal request.',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Scroll to the left/right to search your meal and tap to select ',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/chickenFriedRice.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: GestureDetector(
                            child: Text(
                              'Chicken Fried Rice',
                              style: TextStyle(
                                  color: Colors.lime,
                                  fontSize: 20.0,
                                  backgroundColor: Colors.white),
                            ),
                            onTap: () {
                              return model.mealchoice(
                                  choosenMeal: 'chickenFriedRice.jpg');
                            },
                          ),
                          height: 200.0,
                          width: 200.0,
                          // color: Colors.red,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/mangoStickyRice.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: GestureDetector(
                            child: Text(
                              'Mango Sticky Rice',
                              style: TextStyle(
                                  color: Colors.lime,
                                  fontSize: 20.0,
                                  backgroundColor: Colors.white),
                            ),
                            onTap: () {
                              return model.mealchoice(
                                  choosenMeal: 'mangoStickyRice.jpg');
                            },
                          ),
                          height: 200.0,
                          width: 200.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/mushRoomRisotto.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: GestureDetector(
                            child: Text(
                              'Mush Room Risotto',
                              style: TextStyle(
                                  color: Colors.lime,
                                  fontSize: 20.0,
                                  backgroundColor: Colors.white),
                            ),
                            onTap: () {
                              return model.mealchoice(
                                  choosenMeal: 'mushRoomRisotto.jpg');
                            },
                          ),
                          height: 200.0,
                          width: 200.0,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/perfectFriedRice.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: GestureDetector(
                            child: Text(
                              'Perfect Fried Rice',
                              style: TextStyle(
                                  color: Colors.lime,
                                  fontSize: 20.0,
                                  backgroundColor: Colors.white),
                            ),
                            onTap: () {
                              return model.mealchoice(
                                  choosenMeal: 'perfectFriedRice.jpg');
                            },
                          ),
                          height: 200.0,
                          width: 200.0,
                        ),
                      ],
                    ),
                    height: 200.0,
                    width: 200.0,
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    model.meal == null
                        ? 'You have not selected a meal'
                        : model.meal == 'chickenFriedRice.jpg'
                            ? ' We will have Chicken Fried Rice prepared just for you.'
                            : model.meal == 'mangoStickyRice.jpg'
                                ? 'We will have Mango Sticky Rice prepared just for you.'
                                : model.meal == 'mushRoomRisotto.jpg'
                                    ? 'We will have Mush Room Risotto prepared just for you.'
                                    : model.meal == 'perfectFriedRice.jpg'
                                        ? 'We will have Perfect Fried Rice prepared just for you.'
                                        : '',
                    style: TextStyle(color: Colors.red, fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Please provide your name below(Optional).',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.vertical),
                    child: TextFormField(
                      initialValue: model.userData['name'],
                      decoration: textInputDecoration,
                      // validator: (val) => model.nameValidator(val),
                      onChanged: (val) => model.nameOnChange(val),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(
                      color: Colors.pink[400],
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        model.updateUserData();
                        Navigator.pop(context);
                      }),
                ],
              ),
            ),
          ]);
        }
      },
      viewModelBuilder: () => EditFormViewModel(),
    );
  }
}
