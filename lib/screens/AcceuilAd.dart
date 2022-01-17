import 'package:ffff/screens/CarsAd.dart';
import 'package:ffff/screens/ajoutCar.dart';
import 'package:flutter/material.dart';

class AcceuilAd extends StatelessWidget {
  const AcceuilAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Center(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            title: Text('Acceuil',style: TextStyle(color: Colors.white),),
            centerTitle: true,
            leading: IconButton(
              onPressed: (){
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_ios,
                size:20,
                color:Colors.white,),
            ),),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(image: AssetImage('assets/acceuil.png')),
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor:  Colors.blueGrey,
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),

                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute<void>(
                            builder:(BuildContext context) {
                              return CarsAd();
                            }));

                  },
                  child: const Text("Liste des Voitures",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),


    ),
              const SizedBox(
                height: 44.0,
              ),
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  fillColor:  Colors.blueGrey,
                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),

                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute<void>(
                            builder:(BuildContext context) {
                              return AjoutPage();
                            }));

                  },
                  child: const Text("Ajouter une voiture",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),


              ),
            ],
          ),
        ),
      );
  }
}
