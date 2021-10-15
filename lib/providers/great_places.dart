import 'dart:io';

import 'package:flutter/foundation.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> items = [];

  List<Place> get allItems {
    return [...items];
  }

  void addPlace(String title,File pickedImage){
    final newPlace = Place(id: DateTime.now().toString(), title: title, location: null, image: pickedImage);
    items.add(newPlace);
    notifyListeners();
  }
}