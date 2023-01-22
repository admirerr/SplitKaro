import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login.dart';
import '../model/user_model.dart';

class activityPage extends StatefulWidget {
  const activityPage({Key? key}) : super(key: key);

  @override
  State<activityPage> createState() => _activityPageState();
}

class _activityPageState extends State<activityPage> {



  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor:  Color.fromARGB(255, 227, 227, 227),
      // body: Padding(
      //   padding: const EdgeInsets.only(bottom: 25),
      //   child: Align(
      //     alignment: Alignment.bottomCenter,
      //     child: Text('Activity Page', style: TextStyle(fontSize: 30)),
      //   ),
      // ),


        body: Container(
          color: Colors.blue.withOpacity(.4),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Activity Page", textScaleFactor: 3.0),
                ElevatedButton(
                  child: Text('Welcome ${loggedInUser.name}'),
                  onPressed: () {

                    // final CurvedNavigationBarState? navBarState =
                    //     _bottomNavigationKey.currentState;
                    // navBarState?.setPage(1);


                  },
                ),



                //Text(_page.toString(), textScaleFactor: 10.0),
                ElevatedButton(
                  child: Text('Logout'),
                  onPressed: () {

                    logout(context);


                  },
                )


              ],








            ),
          ),
        )





    );
  }



  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyLogin()));
  }



}
