import 'package:flutter/material.dart';
import 'package:flutter_native_features/helpers/location_helper.dart';
import 'package:flutter_native_features/screens/map_screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  final Function onSelectLocation;

  LocationInput(this.onSelectLocation);

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? previewImageUrl;

  void showPreview(double lat,double lng){
      final staticMapImageUrl = LocationHelper.generatePreviewImageUrl(
      latitude: lat,
      longitude: lng,
    );
    setState(() {
      previewImageUrl = staticMapImageUrl;
    });
  }

  Future<void> getUserLocation() async{
    try{
      final locationData = await Location().getLocation();
      showPreview(locationData.latitude!, locationData.longitude!);
      widget.onSelectLocation(locationData.latitude,locationData.longitude);
    } catch(e){
      return;
    }
    
  }

  Future<void> selectOnMap() async{
   final selectedLocation = await Navigator.of(context).push<LatLng>(MaterialPageRoute(builder: (ctx) => MapScreen(isSelecting: true,)));

    if(selectedLocation == null){
      return;
    }
    showPreview(selectedLocation.latitude, selectedLocation.longitude);
    widget.onSelectLocation(selectedLocation.latitude,selectedLocation.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          alignment : Alignment.center,
          decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey)),
          child: previewImageUrl == null ? const Text('No Location Chosen!',textAlign: TextAlign.center,) : Image.network(previewImageUrl!,fit: BoxFit.cover,width: double.infinity,),
        ),
        const SizedBox(height: 10,),
        Row(
          mainAxisAlignment : MainAxisAlignment.spaceBetween,
          children: [
          ElevatedButton.icon(icon: const Icon(Icons.location_on),label:const Text('Current Location'),onPressed: getUserLocation,),
          ElevatedButton.icon(icon: const Icon(Icons.map),label:const Text('Select on map'),onPressed: selectOnMap,)

        ],)
      ],
    );
  }
}