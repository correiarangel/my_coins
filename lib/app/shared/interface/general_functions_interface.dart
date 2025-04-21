abstract class IGeneralFunctions {
  String? formatNtpHour(DateTime? date);
  String? toBrazilTime(String? date);
  String? formatNumber(String num);
  String? formatNumberBr(String number);
  String? formatNumberUs(String number);
  String? realToCoin(String? priceCoin);
  String? formatNumberBitCoin(String number);
  String? calcRealToCoin(String? priceCoin, String? valueToConvert);
  String? calcCoinToReal(String? priceCoin, String? valueToConvert);
  String? formatCurrency(String number, String currencyCode);
}
