import 'package:desk_focus/services/settings_data_service.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String route;
  final SettingsDataService settings;
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
