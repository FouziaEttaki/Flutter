import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../inscription.dart';
import 'inscription.dart';




class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with SingleTickerProviderStateMixin {

  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;


  @override
  void initState() {
    Firebase.initializeApp(); //initialise l'instance FirebaseApp par défaut
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(

          width: double.infinity,
          height: newheight,
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      onChanged: (value){
                        email = value; },
                      showCursor: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xFF666666),
                          size: defaultIconSize,
                        ),
                        fillColor: Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                            color: Color(0xFF666666),
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize),
                        hintText: "email",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      onChanged: (value){
                        password = value;
                      },
                      showCursor: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          borderSide: BorderSide(
                            width: 0,
                            style: BorderStyle.none,
                          ),
                        ),
                        filled: true,
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Color(0xFF666666),
                          size: defaultIconSize,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye,
                          color: Color(0xFF666666),
                          size: defaultIconSize,
                        ),
                        fillColor: Color(0xFFF2F3F5),
                        hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                        ),
                        hintText: "Mot de passe",
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(onPressed:() async{
                      try{
                        final user = await  _auth.signInWithEmailAndPassword(email: email, password: password);
                        if(user != null)
                        {print("user connecte");
                        }
                      }
                      catch(e){ print(e);  }
                    },


                      child: Text('connexion'),
                    ),

                    SizedBox(
                      height: 2,
                    ),
                  ],
                ),
              ),
              Flexible(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context){
                                return SignUpPage();
                              }, ));
                        },
                        child: Container(
                          child: Text(
                            "Vous n'avez pas de compte? ",
                            style: TextStyle(
                              color: Color(0xFF666666),
                              fontFamily: defaultFontFamily,
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}