import 'package:flutter/material.dart';

import '../routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text('Desk Focus'),
          ),
          DrawerItem(
            icon: Icons.check_box,
            title: 'Tasks',
            route: Routes.tasks,
          ),
          DrawerItem(
            icon: Icons.settings,
            title: 'Settings',
            route: Routes.settings,
          )
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;

  const DrawerItem({Key key, this.icon, this.title, this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(this.icon),
      title: Text(this.title),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, this.route);
      },
    );
  }
}
