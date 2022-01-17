
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/utils.dart';



class detailCarAd extends StatelessWidget{
  final String documentId;

  detailCarAd(this.documentId);
  final _firestore = FirebaseFirestore.instance;



  @override
  Widget build(BuildContext context){
    CollectionReference cars = FirebaseFirestore.instance.collection('Cars');

    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Detail du voiture',style: TextStyle(color: Colors.white),),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size:20,
            color:Colors.white,),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(

        future: cars.doc(documentId).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Scaffold(backgroundColor: Colors.white,);
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
            //return Text("Car: ${data['titre']} ${data['price']}",s,);
            return Scaffold(
              backgroundColor: Theme.of(context).primaryColor,
              body: Column(


                children: [
                  Row(
                    children: [
                      Text('Titre:   ',style: MainHeading),
                      Text("${data['titre']}  ",
                        style: SubHeading,
                      ),

                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Prix:   ',style: MainHeading),
                      Text("${data['price']} dh ",
                        style: SubHeading,
                      ),

                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Couleur:  ',style: MainHeading),
                      Text("${data['color']}  ",
                        style: SubHeading,
                      ),

                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Gearbox:  ',style: MainHeading),
                      Text("${data['gearbox']}  ",
                        style: SubHeading,
                      ),

                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Fuel:   ',style: MainHeading),
                      Text("${data['fuel']}  ",
                        style: SubHeading,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Text('Brand:   ',style: MainHeading),
                      Text("${data['brand']}  ",
                        style: SubHeading,
                      ),

                    ],
                  ),




                ],

              ),
            );


          }

          return Text("loading");
        },
      )


    );
  }

}
