import 'package:ffff/photo.dart';
import 'package:ffff/screens/AcceuilAd.dart';
import 'package:ffff/screens/CarsAd.dart';
import 'package:ffff/screens/ListCar.dart';
import 'package:ffff/screens/ajoutCar.dart';
import 'package:ffff/screens/cars_overviews.dart';
import 'package:ffff/screens/detailCarAd.dart';
import 'package:ffff/screens/inscription.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';



void main() async
{WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();

runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Car',
  theme: ThemeData(
      primaryColor: Colors.white,
      cardColor: Colors.blueGrey,
      accentColor: Colors.blueGrey
  ),
  home: new  HomePage(),
  //home: new AcceuilAd(),
  //home: new LandingScreen(),
  //home: new ListPage('pFJNm0uyLPn8sbFNvJUH'),
  //home: detailCarAd('pFJNm0uyLPn8sbFNvJUH'),
  //home: new CarsAd(),
  routes: {
    '/singup':(context) => SignupPage(),
    '/singin':(context) => HomePage(),
    '/home': (context) => CarsOverviewScreen(),
    //'/detailCarAd': (context) => detailCarAd(),

  },
)
);
}