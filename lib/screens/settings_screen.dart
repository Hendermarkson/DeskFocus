import 'package:desk_focus/services/settings_data_service.dart';
import 'package:desk_focus/widgets/drawer/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: AppDrawer(),
      body: Consumer<SettingsDataService>(
        builder: (_, settings, child) => Container(
          child: ListView(
            children: [
              SwitchListTile(
                title: Text('Enable darkmode'),
                value: settings.darkModeEnabled,
                onChanged: (value) => settings.toggleAppTheme(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
