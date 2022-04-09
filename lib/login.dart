import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(16, 100, 16, 0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.airline_seat_flat),
            Text('Login'),
            // ignore: prefer_const_constructors
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'username',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  print('Login button pressed');
                },
                child: const Text('Enabled'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
