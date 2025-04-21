import 'package:flutter/material.dart';

@immutable
class CoinsParcModel {
  final String id;
  final String code;
  final String name;

  CoinsParcModel({
    required this.id,
    required this.code,
    required this.name,
  });

  factory CoinsParcModel.fromJson(Map<String, dynamic> json) {
    return CoinsParcModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
    );
  }

  CoinsParcModel copyWith({
    String? id,
    String? code,
    String? name,
  }) {
    return CoinsParcModel(
      code: code ?? this.code,
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
