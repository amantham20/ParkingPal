// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:parkingpal/globalvar.dart';
import 'package:parkingpal/login.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parkingpal/globalvar.dart';
import 'package:parkingpal/home.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  /*
   * The variables that store the information in the 3 boxes
   */
  TextEditingController username = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  bool errorBool = false;
  /*
   * Sends the error message for if the attempted sign up information is invalid
   * :param: priority: determines which message would be shown for which box
   * :return: the error message, if no errors arise for that box, returns null
   */
  String? errorMessages(int priority) {
    if (username.text.length < 5 && priority == 0) {
      return "Username is too short";
    }
    if (password1.text.length < 7 && priority == 1) {
      return "Password is too short";
    }
    if (password1.text != password2.text && priority == 1) {
      return "Your Passwords Do Not Match!";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*
       * The code to build the label of the page at the top
       */
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 50, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Sign Up',
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            logo(150),
            const Text(
              'Parking Pal',
              style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            /*
             * The code to build the username entry of the page, top box
             */
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: username,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'email',
                    errorText: errorMessages(0)),
              ),
            ),

            /*
             * The code to build the password entry of the page, middle box
             */
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                controller: password1,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    iconColor: Colors.black,
                    hintText: 'password',
                    errorText: errorMessages(1)),
              ),
            ),

            /*
             * The code to build the password re-entry of the page, bottom box
             */
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                controller: password2,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'password confirmation',
                    errorText: errorMessages(1)),
              ),
            ),

            /*
             * The code for the submit button
             */
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: username.text, password: password1.text);
                    setState(() {
                      movePage(HomePage(), context);
                    });
                  } catch (e) {
                    setState(() {
                      errorBool = true;
                      print("error");
                    });
                  }
                  // setState(() async {
                  //   // if (errorMessages(0) == null && errorMessages(1) == null) {
                  //   /*
                  //     * log the data into server
                  //     * send user to home screen
                  //     */

                  // });
                },
                child: const Text('Sign Up'),
              ),
            ),

            /*
             * The code for the login button
             */
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green)),
                onPressed: () {
                  movePage(const LoginPage(), context);
                },
                child: const Text('Login'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
