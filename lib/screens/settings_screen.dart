import 'package:desk_focus/models/settings_data.dart';
import 'package:desk_focus/widgets/app_drawer.dart';
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
      body: Consumer<SettingsData>(
        builder: (_, settings, child) => Container(
          child: ListView(
            children: [
              SwitchListTile(
                title: Text('Enable darkmode'),
                value: settings.darkMode,
                onChanged: (value) => settings.toggleAppTheme(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
