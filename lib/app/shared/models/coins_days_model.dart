import 'package:flutter/material.dart';

@immutable
class CoinDaysModel {
  final String? high;
  final String? low;
  final String? bid;
  final String? ask;

  CoinDaysModel({
    required this.high,
    required this.low,
    required this.bid,
    required this.ask,
  });

  factory CoinDaysModel.fromJson(Map<String, dynamic> json) {
    return CoinDaysModel(
      high: json['high'],
      low: json['low'],
      bid: json['bid'],
      ask: json['ask'],
    );
  }

  factory CoinDaysModel.empty() {
    return CoinDaysModel(
      high: '',
      low: '',
      bid: '',
      ask: '',
    );
  }

  CoinDaysModel copyWith({
    String? high,
    String? low,
    String? bid,
    String? ask,

  }) {
    return CoinDaysModel(
      high: high ?? this.high,
      low: low ?? this.low,
      bid: bid ?? this.bid,
      ask: ask ?? this.ask,
    );
  }
}
