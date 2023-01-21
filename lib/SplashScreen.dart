import 'dart:async';


import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:split_karo/DashBoard.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  //Initialize Firebase App
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }


  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 2), () {

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MyLogin() ));


      //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => dashboard(),
      //));
    });

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return Container(
              color: Colors.blue,
              child: Center(child: Text('SplitKaro', style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                  color: Colors.white
              ),),),
            );
          }
          return const Center(
          child: CircularProgressIndicator(),
          );
        },
      )
    );
  }
}





// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     body: Container(
//       color: Colors.blue,
//       child: Center(child: Text('SplitKaro', style: TextStyle(
//           fontSize: 34,
//           fontWeight: FontWeight.w700,
//           color: Colors.white
//       ),),),
//     ),
//   );
// }
// }