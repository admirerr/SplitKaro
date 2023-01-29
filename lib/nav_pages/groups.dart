import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login.dart';
import '../model/user_model.dart';

class groupsPage extends StatefulWidget {
  const groupsPage({Key? key}) : super(key: key);


  @override
  State<groupsPage> createState() => _groupsPageState();
}

class _groupsPageState extends State<groupsPage> {





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
    var arrNames = ['Group','Group','Group','Group','Group','Group','Group','Group'];
    return Scaffold(
      body: Container(
        color: Colors.blue.withOpacity(.4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Groups Page", textScaleFactor: 3.0),
              ElevatedButton(
                child: Text('Welcome ${loggedInUser.name}'),
                onPressed: () {
                  // Handle button press here
                },
              ),
              ElevatedButton(
                child: Text('Logout'),
                onPressed: () {
                  logout(context);
                },
              ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return Row(
                      children: [
                        Expanded(
                            child: Text(arrNames[index], style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),)
                        )
                      ],
                    );
                  },
                  itemCount: arrNames.length,
                  separatorBuilder: (context, index){
                    return Divider(height: 100, thickness: 4,);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }



    // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyLogin()));
  }


}
