import 'package:intl/intl.dart';
import 'package:package_info/package_info.dart';

import '../interface/general_functions_interface.dart';

class GeneralFunctions implements IGeneralFunctions {
  @override
  String? formatNtpHour(DateTime? date) {
    var formatedHour;
    if (date != null) {
      var format = DateFormat('yyyy-MM-dd HH:mm');
      formatedHour = format.format(date);
    }
    return formatedHour;
  }

  @override
  Future<String?>? getBuildAndVersion() async {
    try {
      var packageInfo = await PackageInfo.fromPlatform();
      return '${packageInfo.version}+${packageInfo.buildNumber}';
    } on Exception catch (_) {
      return '';
    }
  }

  @override
  String? toBrazilTime(String? date) {
    var formatedHour;
    if (date != null) {
      var format = DateFormat('dd/MM/yyyy HH:mm:ss');
      formatedHour = format.format(DateTime.parse(date));
    }
    return formatedHour;
  }

  @override
  String? formatNumber(String num) {
    var numDoub = double.parse(num).toStringAsFixed(2);
    return numDoub.toString();
  }

  @override
  String realToDollar(String? priceCoin) {
    String? res = "";
    if (priceCoin != null) {
      res = formatNumber((1 / double.parse(priceCoin)).toString());
    }
    return res!;
  }

  @override
  String calcRealToDollar(String? priceCoin, String? valueToConvert) {
    String? res = "";
    var result;
    if (priceCoin != null && valueToConvert != null) {
      result = 1 / double.parse(priceCoin) * int.parse(valueToConvert);
      res = formatNumber(result.toString());
    }
    return res!;
  }

  @override
  String calcDollarToReal(String? priceCoin) {
    String? res = "";
    if (priceCoin != null) {
      res = formatNumber((1 / double.parse(priceCoin)).toString());
    }
    return res!;
  }
}
