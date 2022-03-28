import 'package:intl/intl.dart';
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
    String? res = '';
    if (priceCoin != null) {
      //priceCoin = priceCoin.replaceAll(",", ".");
      //res = formatNumber((1 / double.parse(priceCoin)).toString());
      res = (1 / double.parse(priceCoin)).toString();
    }
    return res;
  }

  @override
  String? calcRealToCoin(String? priceCoin, String? valueToConvert) {
    String? res = '';
    var result;
    if (priceCoin != null && valueToConvert != null) {
      result = 1 / double.parse(priceCoin) * int.parse(valueToConvert);
      res = result.toString();
    }
    return res;
  }

  @override
  String? calcCoinToReal(String? priceCoin, String? valueToConvert) {
    String? res = '';
    var result;
    if (priceCoin != null && valueToConvert != null) {
      result = double.parse(priceCoin) * int.parse(valueToConvert);
      res = result.toString();
    }
    return res;
  }

  @override
  String? formatNumberBitCoin(String number) {
    String? resnumber;
    // ignore: unnecessary_null_comparison
    if (number != null) {
      resnumber = "R\$ $number";
    } else {
      resnumber = "0";
    }
    return resnumber;
  }

  @override
  String? formatNumberBr(String number) {
    var formatter = NumberFormat.decimalPattern('pt_BR');
    String? resnumber;
    // ignore: unnecessary_null_comparison
    if (number != null) {
      resnumber = formatter.format(double.parse(number));
    } else {
      resnumber = '0';
    }
    print('REAL  : $resnumber');
    return resnumber;
  }

  @override
  String? formatNumberUs(String number) {
    var formatter = NumberFormat.decimalPattern('en_US');
    String? resnumber;
    // ignore: unnecessary_null_comparison
    if (number != null) {
      resnumber = formatter.format(double.parse(number));
    } else {
      resnumber = '0';
    }
    print('DOLLAR US : $resnumber');
    return resnumber;
  }
}
