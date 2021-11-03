class CoinDaysModel {
  String? high;
  String? low;
  String? varBid;
  String? pctChange;
  String? bid;
  String? ask;
  String? timestamp;

  CoinDaysModel({
    this.high,
    this.low,
    this.varBid,
    this.pctChange,
    this.bid,
    this.ask,
    this.timestamp,
  });

  factory CoinDaysModel.fromJson(Map<String, dynamic> json) {
    return CoinDaysModel(
      high: json['high'],
      low: json['low'],
      varBid: json['varBid'],
      pctChange: json['pctChange'],
      bid: json['bid'],
      ask: json['ask'],
      timestamp: json['timestamp'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['high'] = high;
    data['low'] = low;
    data['varBid'] = varBid;
    data['pctChange'] = pctChange;
    data['bid'] = bid;
    data['ask'] = ask;
    data['timestamp'] = timestamp;
    return data;
  }
}
