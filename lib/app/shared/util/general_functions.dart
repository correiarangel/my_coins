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
  String realToCoin(String? priceCoin) {
    String? res = "";
    if (priceCoin != null) {
      //priceCoin = priceCoin.replaceAll(",", ".");
      //res = formatNumber((1 / double.parse(priceCoin)).toString());
      res = (1 / double.parse(priceCoin)).toString();
    }
    return res;
  }

  @override
  String? calcRealToCoin(String? priceCoin, String? valueToConvert) {
    String? res = "";
    var result;
    if (priceCoin != null && valueToConvert != null) {
      // priceCoin = priceCoin.replaceAll(",", ".");
      result = 1 / double.parse(priceCoin) * int.parse(valueToConvert);
      res = result.toString();
      //res = formatNumber(result.toString());
    }
    return res;
  }

  @override
  String? calcCoinToReal(String? priceCoin, String? valueToConvert) {
    String? res = "";
    var result;
    if (priceCoin != null && valueToConvert != null) {
      // priceCoin = priceCoin.replaceAll(",", ".");
      result = double.parse(priceCoin) * int.parse(valueToConvert);
      res = result.toString();
      //  res = double.parse(result.toString()).toStringAsFixed(2);
    }
    return res;
  }

  @override
  String? formatNumberBitCoin(String number) {
    String? resnumber;
    // ignore: unnecessary_null_comparison
    if (number != null) {
      resnumber = "R\$ $number"; //formatter.format(double.parse(number));
    } else {
      resnumber = "0";
    }
    return resnumber; // maskFormatter.maskText("$resnumber") ;
  }

  @override
  String? formatNumberBr(String number) {
    var formatter = NumberFormat.decimalPattern("pt_BR");
    String? resnumber;
    // ignore: unnecessary_null_comparison
    if (number != null) {
      resnumber = formatter.format(double.parse(number));
    } else {
      resnumber = "0";
    }
    return resnumber;
  }

  @override
  String? formatNumberUs(String number) {
    var formatter = NumberFormat.decimalPattern("en_US");
    String? resnumber;
    // ignore: unnecessary_null_comparison
    if (number != null) {
      resnumber = formatter.format(double.parse(number));
    } else {
      resnumber = "0";
    }
    return resnumber;
  }
}


/*
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
    var formatter = NumberFormat('###.0##,0#', 'pt_BR');
    print('###.0##,0# , pt_BR  ${formatter.format(double.parse(num))}');
    return formatter.format(double.parse(num)).toString();
  }

  @override
  String realToCoin(String? priceCoin) {
    String? res = "";
    if (priceCoin != null) {
      //priceCoin = priceCoin.replaceAll(",", ".");
      //res = formatNumber((1 / double.parse(priceCoin)).toString());
      res = (1 / double.parse(priceCoin)).toString();
    }
    return res;
  }

  @override
  String? calcRealToCoin(String? priceCoin, String? valueToConvert) {
    String? res = "";
    var result;
    if (priceCoin != null && valueToConvert != null) {
      // priceCoin = priceCoin.replaceAll(",", ".");
      result = 1 / double.parse(priceCoin) * int.parse(valueToConvert);
      res = result.toString();
      //res = formatNumber(result.toString());
    }
    return res;
  }

  @override
  String? calcRealToBitCoin(String? priceCoin, String? valueToConvert) {
    String? res = "";
    var result;
    if (priceCoin != null && valueToConvert != null) {
      //priceCoin = priceCoin.replaceAll(",", ".");
      result = 1 / double.parse(priceCoin) * int.parse(valueToConvert);
      res = result.toString();
      // res = double.parse(result.toString()).toStringAsFixed(5);
    }
    return res;
  }

  @override
  String? calcRealToLiteCoin(String? priceCoin, String? valueToConvert) {
    String? res = "";
    var result;
    if (priceCoin != null && valueToConvert != null) {
      // priceCoin = priceCoin.replaceAll(",", ".");
      result = 1 / double.parse(priceCoin) * int.parse(valueToConvert);
      res = result.toString();
      // res = double.parse(result.toString()).toStringAsFixed(3);
    }
    return res;
  }

  @override
  String? calcCoinToReal(String? priceCoin, String? valueToConvert) {
    var formatter = NumberFormat('###.0##,0#', 'pt_BR');
    print('###.0##,0# , pt_BR  ${formatter.format(priceCoin)}');
    String? res = "";
    var result;
    if (priceCoin != null && valueToConvert != null) {
      // priceCoin = priceCoin.replaceAll(",", ".");
      result = double.parse(priceCoin) * int.parse(valueToConvert);
      res = result.toString();
      //  res = double.parse(result.toString()).toStringAsFixed(2);
    }
    return res;
  }

  @override
  String? calcBitCoinToReal(String? priceCoin, String? valueToConvert) {
    var formatter = NumberFormat('###.0##,0#####', 'pt_BR');
    print('###.calcBitCoinToReal ${formatter.format(priceCoin)}');
    String? res = "";
    var result;
    if (priceCoin != null && valueToConvert != null) {
      result = double.parse(priceCoin) * int.parse(valueToConvert);
      res =  formatter.format(result);
    }
    return res.toString();
  }

  @override
  String? calcLiteCoinToReal(String? priceCoin, String? valueToConvert) {
    var formatter = NumberFormat('###.0##,0#####', 'pt_BR');
     print('###.calcLiteCoinToReal ${formatter.format(priceCoin)}');
    String? res = "";
    var result;
    if (priceCoin != null && valueToConvert != null) {
      result = double.parse(priceCoin) * int.parse(valueToConvert);
      res =  formatter.format(result);
    }
    return res.toString();
  }
  @override
  String? formatNumberBr(String number) {
    var formatter = NumberFormat('###.0##,0#', 'pt_BR');
         print('###.0##,0# , pt_BR  ${formatter.format(double.parse(number))}');
    String? resnumber;
    if (number != null ) {
      resnumber = formatter.format(double.parse(number));
    } else {
      resnumber = "0";
    }
    return resnumber;
  }

  @override
  String? formatNumberUs(String number) {
    var formatter = NumberFormat('###.0#', 'en_US');
    print('###.0#  en_US ${formatter.format(double.parse(number))}');
    String? resnumber;
    if (number != null ) {
      resnumber = formatter.format(double.parse(number));
    } else {
      resnumber = "0";
    }
    return resnumber;
  }
}

 */