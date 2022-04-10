import 'package:flutter/material.dart';
import 'package:parkingpal/globalvar.dart';
import 'package:parkingpal/login.dart';
import 'package:parkingpal/TermsPage.dart';

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
    if (0 < username.text.length && username.text.length < 5 && priority == 0) {
      return "Username is too short";
    }
    if ((!username.text.contains('@') ||
            !username.text.contains('.') ||
            (username.text.indexOf('@') == username.text.length - 1) ||
            (username.text.indexOf('.') == username.text.length - 1)) &&
        priority == 0 &&
        username.text.length > 0) {
      return "Email is not a valid email";
    }
    if (0 < password1.text.length &&
        password1.text.length < 7 &&
        priority == 1) {
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
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /*
                 * The code for the login button
                 */
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  // make a backbutton icon
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const Flexible(
                    child: Center(
                  child: Text(
                    'Sign Up',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                )),
                const SizedBox(
                  width: 50,
                )
              ],
            ),
            picture("logo",150),
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
                  hintText: 'email',
                  errorText: errorMessages(0),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
                  iconColor: Colors.black,
                  hintText: 'password',
                  errorText: errorMessages(1),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
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
                  hintText: 'password confirmation',
                  errorText: errorMessages(1),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'By signing up you are agreeing to our:',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),

            /*
             * The code for the terms button
             */
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(150, 50),
                    primary: Colors.white,
                    side: const BorderSide(
                      width: 1.0,
                      color: Colors.green,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () {
                  movePage(const TermsPage(), context);
                },
                child: const Text(
                  'Terms and Conditions.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            /*
             * The code for the sign-up button
             */
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 12.0, bottom: 0.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(250, 50),
                    primary: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50))),
                onPressed: () async {
                  if (errorMessages(1) != null || errorMessages(0) != null) {
                    setState(() {
                      errorBool = true;
                      print("error");
                    });
                  } else {
                    try {
                      await FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: username.text, password: password1.text);
                      setState(() {
                        movePage(const HomePage(), context);
                      });
                    } catch (e) {
                      setState(() {
                        errorBool = true;
                        print("error $e");
                      });
                    }
                  }
                },
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
