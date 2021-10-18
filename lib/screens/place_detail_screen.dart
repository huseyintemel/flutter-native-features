import 'package:flutter/material.dart';
import 'package:flutter_native_features/providers/great_places.dart';
import 'package:flutter_native_features/screens/map_screen.dart';
import 'package:provider/provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  static const routeName = '/place-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)?.settings.arguments;
    final selectedPlace = Provider.of<GreatPlaces>(context, listen: false).findById(id as String);
    return Scaffold(
      appBar: AppBar(title: Text(selectedPlace.title),),
      body: Column( 
        children: [
          Container(
            height : 250,
            width: double.infinity,
            child: Image.file(selectedPlace.image,fit: BoxFit.cover,width: double.infinity,),
          ),
          const SizedBox(height: 10,),
          Text(selectedPlace.location!.address!,textAlign: TextAlign.center,style: const TextStyle(fontSize: 20,color: Colors.grey),),
          const SizedBox(height: 10,),
          ElevatedButton(child: const Text('View on map'),onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(fullscreenDialog: true,builder: (ctx) => MapScreen(initialLocation: selectedPlace.location!,) ));
          },)

        ],
       ),
    );
  }
}