class CoinModel {
  String? code;
  String? codein;
  String? name;
  String? high;
  String? low;
  String? varBid;
  String? pctChange;
  String? bid;
  String? ask;
  String? timestamp;
  String? createDate;

  CoinModel(
      {this.code,
      this.codein,
      this.name,
      this.high,
      this.low,
      this.varBid,
      this.pctChange,
      this.bid,
      this.ask,
      this.timestamp,
      this.createDate});

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(    
      code : json['code'],
      codein : json['codein'],
      name : json['name'],
      high : json['high'],
      low : json['low'],
      varBid : json['varBid'],
      pctChange : json['pctChange'],
      bid : json['bid'],
      ask : json['ask'],
      timestamp : json['timestamp'],
      createDate : json['create_date'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['code'] = this.code;
    data['codein'] = this.codein;
    data['name'] = this.name;
    data['high'] = this.high;
    data['low'] = this.low;
    data['varBid'] = this.varBid;
    data['pctChange'] = this.pctChange;
    data['bid'] = this.bid;
    data['ask'] = this.ask;
    data['timestamp'] = this.timestamp;
    data['create_date'] = this.createDate;
    return data;
  }
}

/*
   code
   codein
   name
   high
   low
   varBid
   pctChange
   bid
   ask
   timestamp
   createDate
*/