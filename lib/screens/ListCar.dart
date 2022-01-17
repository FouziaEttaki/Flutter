import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ffff/screens/detailCarAd.dart';
import 'package:flutter/material.dart';


import '../utils/utils.dart';

/*
class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container();
  }
}*/

class ListPage extends StatelessWidget {
  final String documentId;

  ListPage(this.documentId);
  final _firestore = FirebaseFirestore.instance;



  @override
  Widget build(BuildContext context) {
    CollectionReference cars = FirebaseFirestore.instance.collection('Cars');


    return FutureBuilder<DocumentSnapshot>(

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
            body: Row(


                  children: [
                    Text("${data['titre']} ** ",
                      style: SubHeading,
                    ),
                    Text("${data['price']} dh ** ",
                      style: SubHeading,),


                Container(

                  child:  Row(
                    children: [
                      RawMaterialButton(    padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 1),

                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          fillColor:  Colors.blueGrey,
                          onPressed: ()  {
                            Navigator.push(context,
                                MaterialPageRoute<void>(
                                    builder:(BuildContext context) {
                                      return detailCarAd(documentId);
                                    }));
                            },
                          child: Text("Detail",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                    Text('  '),

                    RawMaterialButton(    padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 1),

                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0)),
                      fillColor:  Colors.blueGrey,
                      onPressed: ()  {
                        _firestore.collection('Cars').doc(documentId).delete();

                      },

                      child: Text("Delete",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                      ),
                    ),

                    ],
                  ),)
              ],

            ),
          );


        }

        return Text("loading");
      },
    );
  }
}







