import 'package:flutter/material.dart';
import 'package:flutter_native_features/providers/great_places.dart';
import 'package:flutter_native_features/screens/add_place_screen.dart';
import 'package:flutter_native_features/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).fetchAndSetPlaces(),
        builder: (ctx, snapshot) => snapshot.connectionState == ConnectionState.waiting
          ? const  Center( child: CircularProgressIndicator(),)
          : Consumer<GreatPlaces>(
          child: const Center(child: Text('No places yet!'),),
          builder: (ctx,greatPlaces,ch){
            return greatPlaces.items.isEmpty? ch! : ListView.builder(itemCount: greatPlaces.items.length,itemBuilder: (ctx,i) => 
            ListTile(
              leading: CircleAvatar(backgroundImage:FileImage(greatPlaces.items[i].image),),
              title : Text(greatPlaces.items[i].title),
              subtitle: Text(greatPlaces.items[i].location!.address!),
              onTap: (){
                Navigator.of(context).pushNamed(PlaceDetailScreen.routeName,arguments: greatPlaces.items[i].id);
              },
      
            ),);
          },
      
        ),
      )
    );
  }
}
