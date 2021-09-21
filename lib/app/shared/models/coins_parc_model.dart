class CoinParcModel {
  String? id;
  String? code;
  String? name;

  CoinParcModel({
    required this.id,
    required this.code,
    required this.name,
  });

  factory CoinParcModel.fromJson(Map<String, dynamic> json) {
    return CoinParcModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
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