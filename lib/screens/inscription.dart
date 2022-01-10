import 'package:ffff/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:firebase_auth/firebase_auth.dart';




/*
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin {

  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;





  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 4;
    double defaultIconSize = 6;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.purple,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        title: Text('okCar',
            style: SubHeading),
      ) ,
      body: SingleChildScrollView(
        child: SizedBox(


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
                    ElevatedButton(onPressed:()async {
                      try{
                        //final newUser= await _auth.createUserWithEmailAndPassword(email: email, password: password);
                        //if(newUser != null)
                        {Navigator.of(context).pushReplacementNamed('/singin');
                        }
                      }
                      catch(e){
                        print(e);
                      }

                    },


                      child: Text('inscription'),
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



                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/


class SignupPage extends StatefulWidget{
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> with SingleTickerProviderStateMixin {

  late String email;
  late String password;
  final _auth = FirebaseAuth.instance;


  final userNameEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmPasswordEditingController = new TextEditingController();








  @override
  Widget build(BuildContext context){
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios,
          size:20,
          color:Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,

            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Sign up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 20,),
                    Text("Create an account, It's free",
                    style:TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey,
                    ))
                  ],
                ),

    /* Column(

                  children: <Widget>[

                    inputFile(label: "Username"),
                    inputFile(label: "Email"),
                    inputFile(label: "Password", obscureText: true),
                    inputFile(label: "Confirm Password", obscureText: true),

                  ],*/
                SizedBox(
                  height: 15,
                ),
                   TextFormField(
                    autofocus: false,
                    controller: userNameEditingController,
                    keyboardType: TextInputType.name,
                    onSaved: (value){
                      userNameEditingController.text = value! ;
                    },
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_box, color: Colors.black,),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                      hintText: "User Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),


                ),

                TextFormField(
                  onChanged: (value){
                    email = value;
                  },
                  autofocus: false,
                  controller: emailEditingController,
                  keyboardType: TextInputType.emailAddress,
                  onSaved: (value){
                    emailEditingController.text = value! ;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.black,),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),


                ),

                TextFormField(
                  onChanged: (value){
                    password = value;
                  },
                  autofocus: false,
                  controller: passwordEditingController,
                  obscureText: true,
                  onSaved: (value){
                    passwordEditingController.text = value! ;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock, color: Colors.black,),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),


                ),

                TextFormField(
                  autofocus: false,
                  controller: confirmPasswordEditingController,
                  obscureText: true,
                  onSaved: (value){
                    confirmPasswordEditingController.text = value! ;
                  },
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock,color: Colors.black,),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    hintText: "Confirm Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),


                ),












                /* )*/
                Container(decoration:
                BoxDecoration(
                    borderRadius: BorderRadius.circular(50),

                ),
/*
                  child:ElevatedButton(onPressed:()async {
                    try{
                      final newUser= await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if(newUser != null)
                      {Navigator.of(context).pushReplacementNamed('/home');
                      }
                    }
                    catch(e){
                      print(e);
                    }

                  },


                    child: Text('inscription'),
                  ),
                  */
                  child: RawMaterialButton(    padding: const EdgeInsets.symmetric(vertical: 20.0,horizontal: 100),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                    fillColor:  Colors.blueGrey,
                    onPressed: () async { try{
                      final newUser= await _auth.createUserWithEmailAndPassword(email: email, password: password);
                      if(newUser != null)
                      {Navigator.of(context).pushReplacementNamed('/home');
                      }
                    }
                    catch(e){
                      print(e);
                    } },child: Text("Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                  ),

                ),
                Container(
                  padding: EdgeInsets.only(top: 3, left: 3),
                  decoration:
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border(
                        bottom: BorderSide(color:Colors.black),
                        top: BorderSide(color:Colors.black),
                        right: BorderSide(color: Colors.black),
                    )
                  ),



                )
              ],
            ),


          )
        )
    );

  }
}
/*
Widget inputFile({label, obscureText = false}){

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        label,
        style:TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: Colors.black87
        ),
      ),
      SizedBox(
        height: 5,
      ),
      TextField(
        onChanged: (value){
          label = value; },
        obscureText: obscureText,
        controller: labelEditingController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0,
          horizontal: 10),
            //hintText:label,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey
            ),


          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueGrey)
          )
        ),
      ),
      SizedBox(height: 10,)
    ],

*/