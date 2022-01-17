import 'package:ffff/screens/AcceuilAd.dart';
import 'package:ffff/screens/inscription.dart';
import 'package:ffff/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';




/*

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
    double defaultFontSize = 6;
    double defaultIconSize = 6;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;

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
                        {Navigator.of(context).pushReplacementNamed('/home');
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
*/













class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super (key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage>{

  //Initialize Firebase App

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;

  }

  @override
  Widget build(BuildContext context){
    return Scaffold(body: FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot){
        if(snapshot.connectionState == ConnectionState.done){
          return LoginScreen();
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    ),
    );
  }

}


class LoginScreen extends StatefulWidget{

  const LoginScreen({Key? key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  //Login Fonction
  static Future<User?> loginUsingEmailPassword({
    required String email,
    required String password,
    required BuildContext context }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No User Found for that email");
      }
    }
    return user;
  }
  @override
  Widget build(BuildContext context) {
    //create the textfieled controller
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Padding(padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child:
            Text("Cars",

            style: TextStyle
              (color: Colors.blueGrey,
              fontSize: 44.0,
              fontWeight: FontWeight.bold,


            ),

          ),),
         /* const Text("Login to your Application", style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.normal,



          ),

          ),*/

          const SizedBox(
            height: 44.0,
          ),
          TextField(
            controller: _emailController ,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              hintText: "User Email",
              prefixIcon: Icon(Icons.mail, color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 26.0,
          ),
          TextField(
            controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "User Password",
                prefixIcon: Icon(Icons.lock, color: Colors.black),
              )
          ),
          const SizedBox(
            height: 8.0,
          ),






          Flexible(

              child: Row(
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context){
                            return SignupPage();
                          }, ));
                    },
                    child: Container(
                      child: const Text("Vous n'avez pas de compte?",
                        style: TextStyle(
                            color: Colors.blueGrey),
                      ),
                    ),
                  ),

                ],
              ),
            ),






          const SizedBox(
            height: 88.0,
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              fillColor:  Colors.blueGrey,
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),

              onPressed: () async{
                User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                print (user);
                if(user != null){
                  Navigator.push(context,
                      MaterialPageRoute<void>(
                          builder:(BuildContext context) {
                            return AcceuilAd();
                          }));
                  
                }
              },
              child: const Text("Login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),


),

    const SizedBox(
    height: 20.0,
    ),
    Container(
    width: double.infinity,
    child: RawMaterialButton(
    fillColor:  Colors.blueGrey,
    elevation: 0.0,
    padding: const EdgeInsets.symmetric(vertical: 20.0),
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(12.0)),

    onPressed: () async{

    Navigator.of(context).pushReplacementNamed('/home');


    },
    child: const Text("Skip >>>",
    style: TextStyle(
    color: Colors.white,
    fontSize: 18.0,
    ),
    ),
    ),

          ),
        ],
      ),
    );
  }

}

