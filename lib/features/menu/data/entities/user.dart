import 'dart:convert';

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int id;
  final String uniqueId;
  final String name;
  final int? record;
  const User({
    required this.id,
    required this.uniqueId,
    required this.name,
    required this.record,
  });

  @override
  List<Object?> get props => [id, uniqueId, name, record];

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      uniqueId: map['uniqueId'] as String,
      name: map['name'] as String,
      record: map['record'] != null ? map['record'] as int : null,
    );
  }

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);
}
