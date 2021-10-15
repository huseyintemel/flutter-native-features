import 'package:flutter/foundation.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> items = [];

  List<Place> get allItems {
    return [...items];
  }
}