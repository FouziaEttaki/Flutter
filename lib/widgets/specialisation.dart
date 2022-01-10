import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ffff/utils/utils.dart';


class Specialisation extends StatelessWidget{



  final String name;
  final String name2;

  Specialisation({
    required this.name,
    required this.name2});



  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: 100,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child:
          Column(
        children: [
          Text(
            name,
            style: BasicHeading,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            name2,
            style: SubHeading,
          ),
        ],
      )

    );
  }
}