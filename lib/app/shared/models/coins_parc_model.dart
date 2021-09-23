class CoinsParcModel {
  String? id;
  String? code;
  String? name;

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

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    return data;
  }
}
