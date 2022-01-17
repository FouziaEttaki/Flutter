import 'dart:io';

//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ffff/screens/AcceuilAd.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';


import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';






class AjoutPage extends StatefulWidget{

  const AjoutPage({Key? key}) : super(key: key);


  @override
  _AjoutPageState createState() => _AjoutPageState();
}

class _AjoutPageState extends State<AjoutPage> with SingleTickerProviderStateMixin {
/*
  late String email;
  late String password;
*/


  late String title='titre';
  late String price='price';
  late String path='titre';
  late String color='titre';
  late String gearbox='titre';
  late String fuel='titre';
  late String brand='titre';

  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;


  final titleEditingController = new TextEditingController();
  final priceEditingController = new TextEditingController();
  final pathEditingController = new TextEditingController();
  final colorEditingController = new TextEditingController();
  final gearboxEditingController = new TextEditingController();
  final fuelEditingController = new TextEditingController();
  final brandEditingController = new TextEditingController();




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




  late Map data;
  addData(){
    //CollectionReference collectionReference = Firestore.instance.collection('Cars');
  }

  @override
  Widget build(BuildContext context){




    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,
              size:20,
              color:Colors.black,),
          ),
        ),
        body: SingleChildScrollView(

        child: Container(

        padding: EdgeInsets.symmetric(horizontal: 40),
    height: MediaQuery.of(context).size.height - 50,
    width: double.infinity,

    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: <Widget>[
    Column(
    children: <Widget>[
      SizedBox(
        height: 0,
      ),
    Text("Ajouter Voiture",
    style: TextStyle(
    fontSize: 30,
    color: Colors.blueGrey,
    fontWeight: FontWeight.bold,
    )),

            SizedBox(
              height: 20,
            ),
            //Spacer(),
            image!= null ? Image.file(image!, width: 160, height: 160, fit: BoxFit.cover,)
                :Text("No Image Selected"),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
              color:  Colors.white,
                onPressed: (){

              _openGallery();
            },
              child: Text("Select Image",style: TextStyle(
                color: Colors.blueGrey,
              ),),)



    ],

    ),
      SizedBox(
        height: 0,
      ),
      TextFormField(
        onChanged: (value){
          title = value;
        },
        autofocus: false,
        controller: titleEditingController,
        keyboardType: TextInputType.text,
        onSaved: (value){
          titleEditingController.text = value! ;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.car_rental, color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "titre",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),


      ),

      TextFormField(
        onChanged: (value){
          price = value;
        },
        autofocus: false,
        controller: priceEditingController,
        keyboardType: TextInputType.number,
        onSaved: (value){
          priceEditingController.text = value! ;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.price_change_rounded, color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Prix",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),


      ),
/*
      TextFormField(
        onChanged: (value){
          path = value;
        },
        autofocus: false,
        controller: pathEditingController,
        keyboardType: TextInputType.number,
        onSaved: (value){
          pathEditingController.text = value! ;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.image, color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Image",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),


      ),
*/
      TextFormField(
        onChanged: (value){
          gearbox = value;
        },
        autofocus: false,
        controller: gearboxEditingController,
        keyboardType: TextInputType.number,
        onSaved: (value){
          gearboxEditingController.text = value! ;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.format_list_numbered,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Gearbox",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),


      ),


      TextFormField(
        onChanged: (value){
          color = value;
        },
        autofocus: false,
        controller: colorEditingController,
        keyboardType: TextInputType.number,
        onSaved: (value){
          colorEditingController.text = value! ;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.color_lens,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Couleur",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),


      ),


      TextFormField(
        onChanged: (value){
          fuel = value;
        },
        autofocus: false,
        controller: fuelEditingController,
        keyboardType: TextInputType.number,
        onSaved: (value){
          fuelEditingController.text = value! ;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.text_format,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Fuel",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),


      ),


      TextFormField(
        onChanged: (value){
          brand = value;
        },
        autofocus: false,
        controller: brandEditingController,
        keyboardType: TextInputType.number,
        onSaved: (value){
          brandEditingController.text = value! ;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.text_fields,color: Colors.black,),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Brand",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),


      ),




      Container(decoration:
      BoxDecoration(
        borderRadius: BorderRadius.circular(50),

      ),

        child: RawMaterialButton(    padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 100),

          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0)),
          fillColor:  Colors.blueGrey,
          onPressed: () async {
          _firestore.collection('Cars').add({
            'titre': title,
            'price': price,
            'path' : path,
            'gearbox': gearbox,
            'fuel': fuel,
            'color': color,
            'brand' : brand,
          });
          Navigator.push(context,
              MaterialPageRoute<void>(
                  builder:(BuildContext context) {
                    return AcceuilAd();
                  }));


          },


          child: Text("Enregistrer",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),

      ),
      Container(
        padding: EdgeInsets.only(top: 3, left: 3),
        decoration:
        BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            border: Border(
              bottom: BorderSide(color:Colors.black),
              top: BorderSide(color:Colors.black),
              right: BorderSide(color: Colors.black),
            )
        ),



      )
    ],
    ),


        )
        )
    );

  }
}