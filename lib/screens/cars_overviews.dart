import 'package:flutter/material.dart';
import 'package:ffff/utils/utils.dart';
import 'package:ffff/widgets/cars_grid.dart';

class CarsOverviewScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar:AppBar(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          onPressed: () async {
            Navigator.of(context).pushReplacementNamed('/singin');
          },
          icon: Icon(Icons.arrow_back_ios,
            size:20,
            color:Colors.black,),
        ),
        title: Text('Cars',
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
