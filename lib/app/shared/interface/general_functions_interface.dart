abstract class IGeneralFunctions {
  String? formatNtpHour(DateTime? date) {}
  String? toBrazilTime(String? date) {}
  Future<String?>? getBuildAndVersion() async {}
  String? formatNumber(String number) {}
  String? formatNumberBr(String number) {}
  String? realToCoin(String? priceCoin) {}
  String? calcRealToCoin(String? priceCoin, String? valueToConvert) {}
  String? calcCoinToReal(String? priceCoin, String? valueToConvert) {}
  String? calcRealToBitCoin(String? priceCoin, String? valueToConvert) {}
  String? calcBitCoinToReal(String? priceCoin, String? valueToConvert) {}
}
