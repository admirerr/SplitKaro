import 'dart:async';


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:split_karo/DashBoard.dart';

import 'login.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


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
      body: Container(
        color: Colors.blue,
        child: Center(child: Text('SplitKaro', style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w700,
            color: Colors.white
        ),),),
      ),
    );
  }
}