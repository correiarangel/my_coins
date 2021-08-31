abstract class IGeneralFunctions{
  String? formatNtpHour(DateTime? date) {}
  String? toBrazilTime(String? date) {}
  Future<String?>?getBuildAndVersion() async {}
  String? formatNumber(String number){}
  String? realToDollar(String? priceCoin) { }
  String? calcRealToDollar(String? priceCoin, String valueToConvert) { }
  String? calcDollarToReal(String? priceCoin) {}
}