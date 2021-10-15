import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {

  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? previewImageUrl;

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
          ElevatedButton.icon(icon: const Icon(Icons.location_on),label:const Text('Current Location'),onPressed: (){},),
          ElevatedButton.icon(icon: const Icon(Icons.map),label:const Text('Select on map'),onPressed: (){},)

        ],)
      ],
    );
  }
}