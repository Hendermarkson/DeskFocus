import 'package:desk_focus/services/settings_data_service.dart';
import 'app_drawer_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';
import 'drawer_item.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsDataService>(
      builder: (_, settings, child) => Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            AppDrawerHeader(),
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
