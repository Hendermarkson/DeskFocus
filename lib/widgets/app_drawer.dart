import 'package:desk_focus/models/settings_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../routes.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsData>(
      builder: (_, settings, child) => Drawer(
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
              settings: settings,
            ),
            DrawerItem(
              icon: Icons.settings,
              title: 'Settings',
              route: Routes.settings,
              settings: settings,
            )
          ],
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;
  final SettingsData settings;
  const DrawerItem({
    Key key,
    this.icon,
    this.title,
    this.route,
    this.settings,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: settings.selectedPage == route,
      leading: Icon(this.icon),
      title: Text(this.title),
      onTap: () {
        Navigator.pop(context);
        Navigator.pushReplacementNamed(context, route);
        settings.setSelectedPage(route);
      },
    );
  }
}
