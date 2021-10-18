import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_native_features/helpers/db_helper.dart';
import 'package:flutter_native_features/helpers/location_helper.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> items = [];

  List<Place> get allItems {
    return [...items];
  }

  Place findById(String id){
    return items.firstWhere((place) => place.id == id);
  }

  Future<void> addPlace(String title,File pickedImage,PlaceLocation pickedLocation) async{
    final locationAddress = await LocationHelper.getPlaceAdress(pickedLocation.latitude, pickedLocation.longitude);
    final updatedLocation = PlaceLocation(latitude: pickedLocation.latitude, longitude: pickedLocation.longitude,address: locationAddress);
    final newPlace = Place(id: DateTime.now().toString(), title: title, location: updatedLocation, image: pickedImage);
    items.add(newPlace);
    notifyListeners();
    DBHelper.insert('user_places', {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
      'loc_lat' : newPlace.location!.latitude,
      'loc_lng' : newPlace.location!.longitude,
      'address' : newPlace.location!.address!,
    });
  }


  Future<void> fetchAndSetPlaces() async {
    final dataList = await DBHelper.getData('user_places');
    items = dataList.map((item) => 
      Place(
        id: item['id'],
        title: item['title'],
        image: File(item['image']),
        location: PlaceLocation(latitude: item['loc_lat'], longitude: item['loc_lng'], address: item['address']),
      ),
    ).toList();
    notifyListeners();
  }
}