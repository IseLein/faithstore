import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Theme.of(context).primaryColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Theme.of(context).primaryColor
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16.0, bottom: 16.0, left: 32.0, right: 32.0,
          ),
          child: ListView(
            children: [
              const SizedBox(height: 60.0),
              const Icon(FontAwesomeIcons.store, size: 64.0),
              const SizedBox(height: 30.0),
              const TextField(
                decoration: InputDecoration(
                  icon: Icon(FontAwesomeIcons.user),
                  labelText: 'Username',
                ),
              ),
              const SizedBox(height: 30.0),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  icon: Icon(FontAwesomeIcons.key),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 30.0),
              Center(
                child: TextButton(
                  onPressed: () => {},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).highlightColor
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      Theme.of(context).dividerColor
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
