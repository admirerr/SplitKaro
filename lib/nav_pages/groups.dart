import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
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
              AppBar(
                title: Text("Groups", textScaleFactor: 1.5, style: TextStyle(fontFamily: 'Dosis' ,color: Colors.black ,fontWeight: FontWeight.w500),),
                backgroundColor: Colors.white70, centerTitle: true,
                actions: <Widget>
                [
                  new IconButton(
                    onPressed:()
                    {

                    },
                      icon: Icon(Icons.add_circle_sharp, size: 35, color: Colors.blueAccent,),
                  ),
                ],
                ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: Icon(Icons.account_circle, size: 60, color: Colors.black54,),
                      title: Text(arrNames[index],style: TextStyle(fontSize: 22 ,fontStyle: FontStyle.italic ,fontWeight: FontWeight.w500, color: Colors.teal),),
                      subtitle: Text('Status',textScaleFactor: 1.5),
                      trailing: Icon(Icons.double_arrow),
                    );
                  },
                  itemCount: arrNames.length,
                  separatorBuilder: (context, index){
                    return Divider(height: 20, thickness: 4,);
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
