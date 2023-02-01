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
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.blue.withOpacity(.4),
      appBar: AppBar(
        title: Text(
          "Activity",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,

      ),
      body:MyStaticListView(),
    ); //Scaffold
  }




  //@override
  //Widget build(BuildContext context) {
  //   return Scaffold(
  //     //backgroundColor:  Color.fromARGB(255, 227, 227, 227),
  //     // body: Padding(
  //     //   padding: const EdgeInsets.only(bottom: 25),
  //     //   child: Align(
  //     //     alignment: Alignment.bottomCenter,
  //     //     child: Text('Activity Page', style: TextStyle(fontSize: 30)),
  //     //   ),
  //     // ),
  //
  //
  //       body: Container(
  //         color: Colors.blue.withOpacity(.4),
  //         child: Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               Text("Activity Page", textScaleFactor: 3.0),
  //               ElevatedButton(
  //                 child: Text('Welcome ${loggedInUser.name}'),
  //                 onPressed: () {
  //
  //                   // final CurvedNavigationBarState? navBarState =
  //                   //     _bottomNavigationKey.currentState;
  //                   // navBarState?.setPage(1);
  //
  //
  //                 },
  //               ),
  //
  //
  //
  //               //Text(_page.toString(), textScaleFactor: 10.0),
  //               ElevatedButton(
  //                 child: Text('Logout'),
  //                 onPressed: () {
  //
  //                   logout(context);
  //
  //
  //                 },
  //               )
  //
  //
  //             ],
  //
  //
  //
  //
  //
  //
  //
  //
  //           ),
  //         ),
  //       )
  //
  //
  //
  //
  //
  //   );
  // }



  // // the logout function
  // Future<void> logout(BuildContext context) async {
  //   await FirebaseAuth.instance.signOut();
  //   Navigator.of(context).pushReplacement(
  //       MaterialPageRoute(builder: (context) => MyLogin()));
  // }



}



//Added by muskan
// class MainContent extends StatelessWidget {
//
//
//   @override
//   Widget build(BuildContext context) {
//     return new ListView(
//
//          children: <Widget>[
//
//            Padding(
//            padding: const EdgeInsets.symmetric(horizontal:10.0),
//            child: new Container(
//            child:new Column(
//               children: <Widget>[
//                 Row(
//                 children: <Widget>[
//                  new Text("Explore",style: new TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold),textAlign: TextAlign.left,)
//                 ],
//                 )
//
//               ],
//            )
//            ),)
//          ],
//     );
//   }
// }

class MyStaticListView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new ListView(
      children: ListTile.divideTiles
        (
           context: context,
           tiles:
             [
             ListTile(
             leading: Icon(Icons.directions_car),
             title: Text("Car"),
              subtitle: Text("Car is amazing"),
             ),
             ListTile(
             leading: Icon(Icons.bluetooth_searching),
              title: Text("Bluetooth"),
              subtitle: Text("Bluetooth is amazing"),
              ),
              ListTile(
              leading: Icon(Icons.wifi),
              title: Text("Wifi"),
              subtitle: Text("Wifi is amazing"),
              ),
              ListTile(
              leading: Icon(Icons.directions_car),
              title: Text("Car"),
              subtitle: Text("Car is amazing"),
              ),
               ListTile(
                 leading: Icon(Icons.directions_car),
                 title: Text("Car"),
                 subtitle: Text("Car is amazing"),
               ),
               ListTile(
                 leading: Icon(Icons.bluetooth_searching),
                 title: Text("Bluetooth"),
                 subtitle: Text("Bluetooth is amazing"),
               ),
               ListTile(
                 leading: Icon(Icons.wifi),
                 title: Text("Wifi"),
                 subtitle: Text("Wifi is amazing"),
               ),
               ListTile(
                 leading: Icon(Icons.directions_car),
                 title: Text("Car"),
                 subtitle: Text("Car is amazing"),
               ),
               ListTile(
                 leading: Icon(Icons.directions_car),
                 title: Text("Car"),
                 subtitle: Text("Car is amazing"),
               ),
               ListTile(
                 leading: Icon(Icons.bluetooth_searching),
                 title: Text("Bluetooth"),
                 subtitle: Text("Bluetooth is amazing"),
               ),
               ListTile(
                 leading: Icon(Icons.wifi),
                 title: Text("Wifi"),
                 subtitle: Text("Wifi is amazing"),
               ),
               ListTile(
                 leading: Icon(Icons.directions_car),
                 title: Text("Car"),
                 subtitle: Text("Car is amazing"),
               ),
             ],
        ).toList(),
    );
  }
}
