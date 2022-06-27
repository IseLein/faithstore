import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Theme.of(context).dividerColor,
        leading: const Icon(FontAwesomeIcons.store),
        title: const Text("FaithStore"),
      ),
      body: ListView(
        children: const [
          SizedBox(height: 40.0),
          CircleAvatar(
            radius: 60.0,
            backgroundColor: Color.fromRGBO(140, 140, 140, 1.0),
            child: Text("FI"),
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(
              "Faith Iseoluwa",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(child: Text("Admin")),
          SizedBox(height: 30.0),
        ],
      ),
    );
  }
}
