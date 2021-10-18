import 'package:http/http.dart' as http;
import 'dart:convert';

const apiKey = 'AIzaSyC0D3V3ONb5muafVBUqZVHFp2ykSAcG60o';

class LocationHelper {
  static String generatePreviewImageUrl({required double latitude, required double longitude,}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$apiKey';
  }

  static Future<String> getPlaceAdress(double lat, double lng) async{
    final url = Uri.parse('https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$apiKey');
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }

}