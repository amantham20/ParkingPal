import 'package:flutter/material.dart';

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
      /*
       * The code to build the label of the page at the top
       */
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 100, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.airline_seat_flat),
            const Text(
              'Sign Up Page',
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
                    hintText: 'username',
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
                onPressed: () {
                  setState(() {
                    if (errorMessages(0) == null && errorMessages(1) == null) {
                      /*
                      * log the data into server
                      * send user to home screen
                      */
                      print(username.text);
                      print(password1.text);
                      print(password2.text);
                    }
                  });
                },
                child: const Text('Sign Up'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
