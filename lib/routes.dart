import 'package:desk_focus/screens/categories/categories_screen.dart';
import 'package:desk_focus/screens/settings_screen.dart';
import 'package:desk_focus/screens/tasks/tasks_screen.dart';

class Routes {
  static const String home = 'home';
  static const String tasks = 'tasks';
  static const String categories = 'categories';
  static const String settings = 'settings';

  static get config => {
        home: (context) => TasksScreen(),
        tasks: (context) => TasksScreen(),
        settings: (context) => SettingsScreen(),
        categories: (context) => CategoriesScreen(),
      };
}
