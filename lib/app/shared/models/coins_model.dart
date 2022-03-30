import 'package:flutter/material.dart';

@immutable
class CoinModel {
  final String code;
  final String codein;
  final String name;
  final String high;
  final String low;
  final String varBid;
  final String pctChange;
  final String bid;
  final String ask;
  final String timestamp;
  final String createDate;

  CoinModel({
    required this.code,
    required this.codein,
    required this.name,
    required this.high,
    required this.low,
    required this.varBid,
    required this.pctChange,
    required this.bid,
    required this.ask,
    required this.timestamp,
    required this.createDate,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      code: json['code'],
      codein: json['codein'],
      name: json['name'],
      high: json['high'],
      low: json['low'],
      varBid: json['varBid'],
      pctChange: json['pctChange'],
      bid: json['bid'],
      ask: json['ask'],
      timestamp: json['timestamp'],
      createDate: json['create_date'],
    );
  }
  CoinModel copyWith({
    String? code,
    String? codein,
    String? name,
    String? high,
    String? low,
    String? varBid,
    String? pctChange,
    String? bid,
    String? ask,
    String? timestamp,
    String? createDate,
  }) {
    return CoinModel(
      code: code ?? this.code,
      codein: codein ?? this.codein,
      name: name ?? this.name,
      high: high ?? this.high,
      low: low ?? this.low,
      varBid: varBid ?? this.varBid,
      pctChange: pctChange ?? this.pctChange,
      bid: bid ?? this.bid,
      ask: ask ?? this.ask,
      timestamp: timestamp ?? this.timestamp,
      createDate: createDate ?? this.createDate,
    );
  }

  factory CoinModel.empty() => CoinModel(
      code: '',
      codein: '',
      name: '',
      high: '',
      low: '',
      varBid: '',
      pctChange: '',
      bid: '',
      ask: '',
      timestamp: '',
      createDate: '',
    );
}
