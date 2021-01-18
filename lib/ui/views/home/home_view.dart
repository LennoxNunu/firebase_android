import 'package:firebase_android/ui/views/cateringlist/catering_list_view.dart';
import 'package:firebase_android/ui/views/editform/edit_form_view.dart';
import 'package:firebase_android/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) {
        void _showSettingsPanel() {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return Container(
                  color: Colors.orange[200],
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  // EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
                  child: EditFormView(),
                );
              });
        }

        return Scaffold(
          backgroundColor: Colors.orange[50],
          appBar: AppBar(
            title: Text('Catering'),
            backgroundColor: Colors.orange[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.edit),
                label: Text('edit'),
                onPressed: () => _showSettingsPanel(),
              ),
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await model.signOut();
                },
              ),
            ],
          ),
          body: Container(
            child: CateringListView(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/rice.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
