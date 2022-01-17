import 'package:flutter/material.dart';

import '../utils/utils.dart';
import 'ListCar.dart';
//import 'package:vector_math/vector_math_lists.dart';

class CarsAd extends StatelessWidget {
  const CarsAd() : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(elevation: 0,
        foregroundColor: Colors.white,
        title: Text('Liste des voitures',
            style: SubHeading),
        centerTitle: true,
        brightness: Brightness.light,
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
            size:20,
            color:Colors.black,),
        ),
      ),
      body:
       ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Container(
            height: 50,
            color: Colors.blueGrey,
            child: ListPage('elL1duDQ862KJ1FWDdRA'),
          ),
          Container(
            height: 50,
            color: Colors.blueGrey,
            child: ListPage('W0CngXIAtTbDCDX4DAD7'),
          ),
          Container(
            height: 50,
            color: Colors.blueGrey,
            child: ListPage('2Dr5GzOKJWEAJV9972yA'),
          ),
          Container(
            height: 50,
            color: Colors.blueGrey,
            child: ListPage('EuKa5ETEb53x5kErTzV1'),
          ),
        ],
      ),
    );
  }
}
