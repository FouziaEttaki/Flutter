import 'package:flutter/material.dart';
import 'package:ffff/utils/utils.dart';
import 'package:ffff/widgets/cars_grid.dart';

class CarsOverviewScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar:AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: Text('okCar',
            style: SubHeading),
      ) ,
      body: ListView(
        children: [
          Padding(

            padding: const EdgeInsets.all(8.0),
            child: Text('Available Cars',
              style: MainHeading,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CarsGrid(),
          )

        ],

      ),
    );
  }
}
