import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  final Function onSelectImage;

  ImageInput(this.onSelectImage);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? storedImage;

  Future<void> takePicture() async{
    final picker = ImagePicker();
    final imageFile = await picker.pickImage(source: ImageSource.camera,maxWidth: 600);
    if(imageFile == null){
      return;
    }
    setState(() {
      storedImage = File(imageFile.path);
    });
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await storedImage!.copy('${appDir.path}/$fileName');
    widget.onSelectImage(savedImage);
  }


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
              onPressed: takePicture,
            ),
          ),
        )
      ],
    );
  }
}