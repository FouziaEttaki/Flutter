import 'package:ffff/models/car.dart';
import 'package:flutter/material.dart';
import 'package:ffff/utils/utils.dart';
import 'package:ffff/widgets/specialisation.dart';
import 'package:ffff/widgets/specific_car.dart';

class CarDetail extends StatelessWidget{

  final String title;
  final double price;
  final String color;
  final String gearbox;
  final String fuel;
  final String brand;
  final String path;


  CarDetail({required this.title,
    required this.price,
    required this.color,
    required this.gearbox,
    required this.fuel,
    required this.brand,
    required this.path});

  @override
  Widget build(BuildContext context){

    return Scaffold(


      appBar:AppBar(
        backgroundColor: Colors.purple,
        actions:[
          IconButton(icon: Icon(Icons.bookmark, size:30,
          color: Theme.of(context).cardColor), onPressed: null,),

          IconButton(icon: Icon(Icons.share, size:30,
              color: Theme.of(context).cardColor), onPressed: null,),

        ],
      ),

      body: Column(
        children: [
          Text(title, style: MainHeading),
          Text(
            brand,
            style: BasicHeading,
          ),
          Hero(tag: title, child: Image.asset(path)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SpecificCar(
                name: '12 Month',
                price: price * 12,
                name2: 'Dollars',
              ),
              SpecificCar(
                name: '6 Month',
                price: price * 6,
                name2: 'Dollars',
              ),
              SpecificCar(
                name: '1 Month',
                price: price * 1,
                name2: 'Dollars',
              )
            ],
          ),
          SizedBox(height: 20),
          Text(
            'SPECIFICATIONS',
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              Specialisation(
                name: 'Color',
                name2: color,


              ),
              Specialisation(
                name: 'Gearbox',
                name2: gearbox,


              ),
              Specialisation(
                name: 'Fuel',
                name2: fuel,


              )
            ],
          ),
          SizedBox(height: 10),
          RaisedButton(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            disabledColor: Theme.of(context).accentColor,
            onPressed: null,
            child: Text(
              'Book Now',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          )
        ],
      ),


    );
  }
}