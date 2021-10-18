const apiKey = 'pk.eyJ1IjoiYWxpMjE1MjIxOCIsImEiOiJja3V3YTB1bTc0MmtrMzNvNnRmY3lpOWg4In0.vBJ5ZM_QJyyM4pqOEeMFrw';

class LocationHelper {
  static String generatePreviewImageUrl({double? latitude, double? longitude}){
   return 'https://api.mapbox.com/styles/v1/mapbox/streets-v11/static/pin-l($longitude,$latitude)/$longitude,$latitude,14.25,0,0/600x300?access_token=$apiKey';   
  } 
}
