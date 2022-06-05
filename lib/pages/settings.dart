import 'package:flutter/material.dart';
import 'package:faithstore/widgets/main_drawer.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FaithStore"),
      ),
      drawer: MainDrawer(currentPage: 4),
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
