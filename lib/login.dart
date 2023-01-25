import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:split_karo/profile_screen.dart';

import 'DashBoard.dart';


void main() => runApp (MaterialApp(home: MyLogin()));


class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {



  // form key
  final _formKey = GlobalKey<FormState>();

  // editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();



  //firebase
  final _auth = FirebaseAuth.instance;


  // string for displaying the error Message
  String? errorMessage;





  //Login function

  // static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async{
  // FirebaseAuth auth = FirebaseAuth.instance;
  // User? user;
  // try {
  //   UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
  //   user = userCredential.user;
  // } on FirebaseAuthException catch (e){
  //   if(e.code == "user-not-found"){
  //     print("No User found for the email");
  // }
  // }
  //  return user;
  //
  // }




  @override
  Widget build(BuildContext context) {

    //Create the textfiled controller
    // TextEditingController _emailController = TextEditingController();
    // TextEditingController _passwordController = TextEditingController();



    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 130),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                        TextFormField(
                            //controller: emailController,


                          autofocus: false,
                          controller: emailController,
                          keyboardType: TextInputType.emailAddress,


                          //validator
                            validator: (value){
                    if(value!.isEmpty){
                        return ("Please Enter your Email");
                      }

                    // reg expression for email validation
                    if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                        .hasMatch(value)) {
                  return ("Please Enter a valid email");
                  }
                  return null;

                  },


                          onSaved: (value) {
                            emailController.text = value!;
                          },
                           textInputAction: TextInputAction.next,
                          // decoration: InputDecoration(
                          //   prefixIcon: Icon(Icons.mail),
                          //   contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                          //   hintText: "Email",
                          //   border: OutlineInputBorder(
                          //     borderRadius: BorderRadius.circular(10),
                          //   ),
                          // );



                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.mail),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Email",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            //controller: _passwordController,


                            autofocus: false,
                            controller: passwordController,



                            //validator
                            validator: (value) {
                              RegExp regex = new RegExp(r'^.{6,}$');
                              if (value!.isEmpty) {
                                return ("Password is required for login");
                              }
                              if (!regex.hasMatch(value)) {
                                return ("Enter Valid Password(Min. 6 Character)");
                              }
                            },


                            onSaved: (value) {
                              passwordController.text = value!;
                            },

                            textInputAction: TextInputAction.done,

                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.vpn_key),
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                //backgroundColor: Color(0xff4c505b),
                                backgroundColor: Colors.blue,
                                child: IconButton(
                                    color: Colors.white,

                                    //onPressed: () async {
                                    onPressed: () {

                                      signIn(emailController.text, passwordController.text);

                                      //Let's test the app
                                      // User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                                      // print(user);
                                      //
                                      // if(user != null){
                                      //   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => BottomNavBar()));
                                      // }
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, 'register');
                                },
                                child: Text(
                                  'Sign Up',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

  }









  // login function
  void signIn(String email, String password) async {
    //if (_formKey.currentState!.validate()) {
      try {
        await _auth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((uid) => {
          Fluttertoast.showToast(msg: "Login Successful"),
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => BottomNavBar())),
        });
      } on FirebaseAuthException catch (error) {
        switch (error.code) {
          case "invalid-email":
            errorMessage = "Your email address appears to be malformed.";

            break;
          case "wrong-password":
            errorMessage = "Your password is wrong.";
            break;
          case "user-not-found":
            errorMessage = "User with this email doesn't exist.";
            break;
          case "user-disabled":
            errorMessage = "User with this email has been disabled.";
            break;
          case "too-many-requests":
            errorMessage = "Too many requests";
            break;
          case "operation-not-allowed":
            errorMessage = "Signing in with Email and Password is not enabled.";
            break;
          default:
            errorMessage = "An undefined Error happened.";
        }
        Fluttertoast.showToast(msg: errorMessage!);
        print(error.code);
      }
    //}
  }

}