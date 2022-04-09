import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password1 = TextEditingController();
  TextEditingController password2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 100, 16, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.airline_seat_flat),
            const Text(
              'Sign Up Page',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: username,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'username',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                controller: password1,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                obscureText: true,
                controller: password2,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'password confirmation',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  if (password1.text != password2.text) {
                    print("you suck");
                    /*
                    * display when you have mismatching passwords
                    */
                  } else {
                    /*
                    * log the data into server
                    * send user to home screen
                    */
                    print(username.text);
                    print(password1.text);
                    print(password2.text);
                  }
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
