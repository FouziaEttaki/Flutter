
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {

  File? image;

  _openGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if(image==null) return;

      final imageTemporary =File(image.path);
      setState(()=> this.image = imageTemporary);
    } on PlatformException catch (e) {
      print ('Failed to pick image: $e');
    }
  }
  _openCamera(){

  }

  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context, builder: (BuildContext context){
      return AlertDialog(
        title: Center(child: Text("Make a choice!")),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              GestureDetector(
                child: Text("Gallery"),
                onTap: (){
                  _openGallery();
                },
              ),
              
              Padding(padding: EdgeInsets.all(5.0)),

              GestureDetector(
                child:
                Text("Camera"),
                onTap: (){
                  _openCamera();
                },
              )
            ],
          ),
        ),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Screen"),
      ),
      body: Container(
        child: Center(
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              //Spacer(),
              image!= null ? Image.file(image!, width: 160, height: 160, fit: BoxFit.cover,)
              :Text("No Image Selected"),
              SizedBox(
                height: 20,
              ),
              RaisedButton(onPressed: (){
                //_showChoiceDialog(context);
                _openGallery();
              },
              child: Text("Select Image"),)
            ],
          ),
        ),
      )

    );
  }
}
