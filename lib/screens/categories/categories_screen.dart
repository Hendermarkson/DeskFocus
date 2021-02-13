import 'package:desk_focus/widgets/drawer/app_drawer.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      drawer: AppDrawer(),
      body: Container(),
    );
  }
}
