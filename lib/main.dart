import 'package:flutter/material.dart';
import 'package:flutter_native_features/providers/great_places.dart';
import 'package:flutter_native_features/screens/add_place_screen.dart';
import 'package:flutter_native_features/screens/place_detail_screen.dart';
import 'package:flutter_native_features/screens/places_list_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: GreatPlaces(),
        child: MaterialApp(
        title: 'Great Places',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: PlacesListScreen(),
        routes: {
          AddPlaceScreen.routeName : (ctx) => AddPlaceScreen(),
          PlaceDetailScreen.routeName : (ctx) => PlaceDetailScreen(),
        },
      ),
    );
  }
}
