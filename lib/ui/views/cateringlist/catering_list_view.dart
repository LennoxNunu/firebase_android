import 'package:firebase_android/ui/shared/loading.dart';
import 'package:firebase_android/ui/views/cateringlist/catering_list_viewmodel.dart';
import 'package:firebase_android/ui/views/cateringtile/catering_tile_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CateringListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CateringListViewModel>.reactive(
      builder: (context, model, child) {
        if (model.caterings == null) {
          return Loading();
        } else {
          return ListView.builder(
            itemCount: model.caterings.length,
            itemBuilder: (context, index) {
              return CateringTileView(catering: model.caterings[index]);
            },
          );
        }
      },
      viewModelBuilder: () => CateringListViewModel(),
    );
  }
}
