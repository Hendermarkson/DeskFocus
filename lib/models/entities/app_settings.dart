class AppSetting {
  final int id;
  final String name;
  final String value;

  AppSetting({this.id, this.name, this.value});

  AppSetting copyWith({
    String id,
    String name,
    String value,
  }) {
    return AppSetting(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
    );
  }

  factory AppSetting.fromJson(Map<String, dynamic> json) => AppSetting(
        id: json['id'],
        name: json['name'],
        value: json['value'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'value': value,
      };
}
