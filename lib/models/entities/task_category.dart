import 'package:equatable/equatable.dart';

class TaskCategory extends Equatable {
  final int id;
  final String name;
  final String color;
  final String icon;

  TaskCategory({this.id, this.name, this.color, this.icon});

  factory TaskCategory.fromJson(Map<String, dynamic> json) => TaskCategory(
      id: json['id'],
      name: json['name'],
      color: json['color'],
      icon: json['icon']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'color': color,
        'icon': icon,
      };

  @override
  List<Object> get props => [id, name, color, icon];
}
