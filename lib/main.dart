import 'package:ffff/photo.dart';
import 'package:ffff/screens/ajoutCar.dart';
import 'package:ffff/screens/cars_overviews.dart';
import 'package:ffff/screens/inscription.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'photo.dart';


void main() async
{WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp();
runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Car',
  theme: ThemeData(
      primaryColor: Colors.white,
      cardColor: Colors.blueGrey,
      accentColor: Colors.purple
  ),
 // home: new  HomePage(),
  home: new AjoutPage(),
  //home: new LandingScreen(),
  routes: {
    '/singup':(context) => SignupPage(),
    '/singin':(context) => HomePage(),
    '/home': (context) => CarsOverviewScreen(),

  },
)
);
}