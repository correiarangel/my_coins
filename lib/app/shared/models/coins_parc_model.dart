class CoinParcModel {
  String? id;
  String? code;
  String? name;

  CoinParcModel(
      {required this.id,
        required this.code,
      required this.name,});

  factory CoinParcModel.fromJson(Map<String, dynamic> json) {
    return CoinParcModel(
      id : json['id'],    
      code : json['code'],
      name : json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['code'] = this.code;
    data['name'] = this.name;
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