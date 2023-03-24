import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import '../login.dart';
import '../model/user_model.dart';
import 'group_details_page.dart';

class groupsPage extends StatefulWidget {
  const groupsPage({Key? key}) : super(key: key);

  @override
  State<groupsPage> createState() => _groupsPageState();
}

class _groupsPageState extends State<groupsPage> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  TextEditingController _groupNameController = TextEditingController();
  List<String> groupNames = []; // new list to store group names

  @override
  void initState() {
    super.initState();
    // Fetch the group names from Firebase and store them in groupNames list
    FirebaseFirestore.instance.collection("groups").get().then((querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        groupNames.add(doc.get("name"));
      });
      setState(() {});
    });

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
  void dispose() {
    _groupNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _groupsStream = FirebaseFirestore.instance.collection("groups").snapshots();
    return Scaffold(
      body: Container(
        color: Colors.blue.withOpacity(.4),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppBar(
                title: Text(
                  "Groups",
                  textScaleFactor: 1.5,
                  style: TextStyle(
                      fontFamily: 'Dosis',
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                backgroundColor: Colors.white70,
                centerTitle: true,
                actions: <Widget>[
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('New Group'),
                          content: TextField(
                            controller: _groupNameController,
                            decoration: InputDecoration(
                              hintText: 'Enter group name',
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();


                              },
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                FirebaseFirestore.instance
                                    .collection("groups")
                                    .add({
                                  "name": _groupNameController.text.trim(),
                                  "owner": user!.uid,
                                });
                                Navigator.of(context).pop();
                                _groupNameController.clear();
                              },
                              child: Text('Create'),
                            ),
                          ],
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.add_circle_sharp,
                      size: 35,
                      color: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: _groupsStream,
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return Text('Something went wrong');
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final groups = snapshot.data!.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
                    final groupNames = groups.map((group) => group['name']).toList();

                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GroupDetailsPage(groupName: groupNames[index]),
                              ),
                            );
                          },
                          child: ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              size: 60,
                              color: Colors.black54,
                            ),
                            title: Text(
                              groupNames[index],
                              style: TextStyle(
                                  fontSize: 22,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.teal),
                            ),
                            subtitle: Text('Status', textScaleFactor: 1.5),
                            trailing: Icon(Icons.double_arrow),
                          ),
                        );
                      },
                      itemCount: groupNames.length,
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 20,
                          thickness: 4,
                        );
                      },
                    );

                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}