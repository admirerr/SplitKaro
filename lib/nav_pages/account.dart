import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../login.dart';
import '../model/user_model.dart';

class accountPage extends StatefulWidget {
  const accountPage({Key? key}) : super(key: key);

  @override
  State<accountPage> createState() => _accountPageState();
}

class _accountPageState extends State<accountPage> {


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
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue.withOpacity(.4),
        appBar: AppBar(
          title: Text(
            "Settings",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              // user card
              SimpleUserCard(
                userName: "${loggedInUser.name}",
                userProfilePic: AssetImage("assets/prof_picb.jpg"),
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.pencil_outline,
                    iconStyle: IconStyle(),
                    title: 'Appearance',
                    subtitle: "Make Ziar'App yours",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.fingerprint,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: 'Privacy',
                    subtitle: "Lock Ziar'App to improve your privacy",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.dark_mode_rounded,
                    iconStyle: IconStyle(
                      iconsColor: Colors.white,
                      withBackground: true,
                      backgroundColor: Colors.red,
                    ),
                    title: 'Dark mode',
                    subtitle: "Automatic",
                    trailing: Switch.adaptive(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              SettingsGroup(
                items: [
                  SettingsItem(
                    onTap: () {},
                    icons: Icons.info_rounded,
                    iconStyle: IconStyle(
                      backgroundColor: Colors.purple,
                    ),
                    title: 'About',
                    subtitle: "Learn more about Ziar'App",
                  ),
                ],
              ),
              // You can add a settings title
              SettingsGroup(
                settingsGroupTitle: "Account",
                items: [
                  SettingsItem(
                    onTap: () {
                      logout(context);
                    },
                    icons: Icons.exit_to_app_rounded,
                    title: "Sign Out",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.repeat,
                    title: "Change email",
                  ),
                  SettingsItem(
                    onTap: () {},
                    icons: CupertinoIcons.delete_solid,
                    title: "Delete account",
                    titleStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }





  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor:  Color.fromARGB(255, 227, 227, 227),
  //     // body: Padding(
  //     //   padding: const EdgeInsets.only(bottom: 25),
  //     //   child: Align(
  //     //     alignment: Alignment.bottomCenter,
  //     //     child: Text('Account Page', style: TextStyle(fontSize: 30)),
  //     //   ),
  //     // ),
  //
  //
  //
  //       body: Container(
  //         color: Colors.blueAccent,
  //         child: Center(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: <Widget>[
  //               Text("Account Page", textScaleFactor: 3.0),
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
  //   );
  // }



  // the logout function
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MyLogin()));
  }




}
