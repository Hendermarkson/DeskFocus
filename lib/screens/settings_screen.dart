import 'package:desk_focus/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Center(
          child: Text('Settings'),
        ),
      ),
    );
  }
}
