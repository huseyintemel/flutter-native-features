import 'package:flutter/material.dart';
import 'dart:io';

class ImageInput extends StatefulWidget {

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? storedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 150,
          height:100,
          decoration: BoxDecoration(border: Border.all(width: 1,color: Colors.grey)),
          child: storedImage != null ? Image.file(storedImage!,fit: BoxFit.cover,width:double.infinity) : const Text('No Image Taken',textAlign: TextAlign.center,),
          alignment: Alignment.center,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.camera,color: Colors.white,),
              label: const Text('Take Picture',style: TextStyle(color: Colors.white),),
              onPressed: (){
        
              },
            
            ),
          ),
        )
      ],
    );
  }
}