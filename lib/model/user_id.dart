class UserId {
  final String name;
  final String value;

  UserId({
    required this.name,
    required this.value,
  });

  factory UserId.fromMap(Map<String, dynamic> json) {
    return UserId(
      name: json['name'],
      value: json['value'],
    );
  }
}
