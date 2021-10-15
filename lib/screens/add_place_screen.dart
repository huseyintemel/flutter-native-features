import 'package:flutter/material.dart';
import 'package:flutter_native_features/widgets/image_input.dart';

class AddPlaceScreen extends StatefulWidget {
  static const routeName = '/add-place';

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add A New Place'),),

      body: Column(
        mainAxisAlignment : MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  TextField(
                    decoration : const InputDecoration(labelText: 'Title',),
                    controller : titleController,
                  ),
                  const SizedBox(height: 20,),
                  ImageInput(),
                ],
              ),
            ),
          )),
          TextButton.icon(
            icon: const Icon(Icons.add,color: Colors.white,), 
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.indigo),elevation: MaterialStateProperty.all(0),tapTargetSize: MaterialTapTargetSize.shrinkWrap), 
            label: const Text('Add Place',style: TextStyle(color: Colors.white),),
            onPressed: (){

          },),
        ]  
      ),
    );
  }
}