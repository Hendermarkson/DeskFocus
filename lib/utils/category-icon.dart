import 'package:desk_focus/models/entities/task_category.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

Icon getCategoryIcon(TaskCategory category) {
  IconData icon = Icons.lens_outlined;
  int colorCode = 0x3F000000;
  if (category != null) {
    icon = iconList[category.icon] ?? icon;
    colorCode = int.tryParse(category.color) ?? colorCode;
  }

  return Icon(
    icon,
    color: Color(colorCode),
  );
}
