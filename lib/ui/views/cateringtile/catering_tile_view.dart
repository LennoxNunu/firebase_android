import 'package:firebase_android/app/catering.dart';
import 'package:firebase_android/ui/views/cateringtile/catering_tile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CateringTileView extends StatelessWidget {
  final Catering catering;
  CateringTileView({this.catering});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CateringTileViewModel>.reactive(
      builder: (context, model, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${catering.meal}'),
                radius: 25.0,
                //        backgroundColor: Colors.brown[brew.strength],
              ),
              title: Text(catering.name),
              subtitle: Text(
                catering.meal == 'chickenFriedRice.jpg'
                    ? ' will eat Chicken Fried Rice.'
                    : catering.meal == 'mangoStickyRice.jpg'
                        ? 'will eat Mango Sticky Rice.'
                        : catering.meal == 'mushRoomRisotto.jpg'
                            ? 'will eat Mush Room Risotto.'
                            : catering.meal == 'perfectFriedRice.jpg'
                                ? 'will eat Pecfect Fried Rice.'
                                : 'meal not specified.',
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => CateringTileViewModel(),
    );
  }
}
