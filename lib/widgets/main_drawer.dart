import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({Key? key, required this.currentPage}) : super(key: key);

  final int currentPage;
  final List<List> menuItems = [
    ["Home", FontAwesomeIcons.house],
    ["Orders", FontAwesomeIcons.book],
    ["Sales", FontAwesomeIcons.print],
    ["Stock", FontAwesomeIcons.arrowTrendUp],
    ["Settings", FontAwesomeIcons.user],
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: const [
                CircleAvatar(
                  radius: 30.0,
                  backgroundColor: Color.fromRGBO(140, 140, 140, 1.0),
                  child: Text("FI"),
                ),
                Text(
                  "Faith Iseoluwa",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text("Admin"),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: menuItems.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {},
                tileColor: (index == currentPage)
                    ? const Color.fromRGBO(208, 208, 208, 1.0)
                    : const Color.fromRGBO(250, 250, 250, 1.0),
                leading: Icon(menuItems[index][1]),
                title: Text(menuItems[index][0]),
              );
            },
          )
        ],
      ),
    );
  }
}
