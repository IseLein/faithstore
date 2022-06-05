import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const SizedBox(height: 60.0),
              Image.asset(
                'assets/images/FS.png',
                height: 200.0,
                width: 200.0,
              ),
              const SizedBox(height: 30.0),
              const TextField(
                decoration: InputDecoration(
                  icon: Icon(FontAwesomeIcons.user),
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 30.0),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(FontAwesomeIcons.key),
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 30.0),
              Center(
                child: TextButton(
                  onPressed: () => {},
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(
                      fontSize: 20,
                    ),
                    primary: Colors.white,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.all(16.0),
                  ),
                  child: const Text("Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
