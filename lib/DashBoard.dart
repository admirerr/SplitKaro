import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DashBoard'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Text('Welcome', style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,

              ),),
              SizedBox(
                height: 11,
              ),
              ElevatedButton(onPressed: (){}, child: Text('Next'))
            ],
          ),
        )
    );
  }

}