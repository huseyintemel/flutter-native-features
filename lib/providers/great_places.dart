import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_native_features/helpers/db_helper.dart';

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
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    });
  }


  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    items = dataList.map((item) => 
      Place(
        id: item['id'],
        title: item['title'],
        image: File(item['image']),
        location: null,
      ),
    ).toList();
    notifyListeners();
  }
}