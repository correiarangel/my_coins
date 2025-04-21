import 'package:flutter/material.dart';

@immutable
class CoinModel {
  final String code;
  final String name;
  final String high;
  final String low;
  final String bid;
  final String ask;
  final String createDate;

  CoinModel({
    required this.code,
    required this.name,
    required this.high,
    required this.low,
    required this.bid,
    required this.ask,
    required this.createDate,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      code: json['code'],
      name: json['name'],
      high: json['high'],
      low: json['low'],
      bid: json['bid'],
      ask: json['ask'],
      createDate: json['create_date'],
    );
  }
  CoinModel copyWith({
    String? code,
    String? name,
    String? high,
    String? low,
    String? bid,
    String? ask,
    String? createDate,
  }) {
    return CoinModel(
      code: code ?? this.code,
      name: name ?? this.name,
      high: high ?? this.high,
      low: low ?? this.low,
      bid: bid ?? this.bid,
      ask: ask ?? this.ask,
      createDate: createDate ?? this.createDate,
    );
  }

  factory CoinModel.empty() => CoinModel(
        code: '',
        name: '',
        high: '',
        low: '',
        bid: '',
        ask: '',
        createDate: '',
      );
}
