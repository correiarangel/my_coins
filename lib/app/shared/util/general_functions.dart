import 'package:intl/intl.dart';
import '../interface/general_functions_interface.dart';

class GeneralFunctions implements IGeneralFunctions {
  static final _brlFormatter = NumberFormat.currency(
    locale: 'pt_BR',
    symbol: 'R\$',
    decimalDigits: 2,
  );

  static final _usdFormatter = NumberFormat.currency(
    locale: 'en_US',
    symbol: '\$',
    decimalDigits: 2,
  );

  static final _eurFormatter = NumberFormat.currency(
    locale: 'de_DE',
    symbol: '€',
    decimalDigits: 2,
  );

  static final _btcFormatter = NumberFormat.currency(
    locale: 'en_US',
    symbol: '₿',
    decimalDigits: 8,
  );

  @override
  String? formatNtpHour(DateTime? date) {
    if (date == null) return null;
    return DateFormat('yyyy-MM-dd HH:mm').format(date);
  }

  @override
  String? toBrazilTime(String? date) {
    if (date == null) return null;
    return DateFormat('dd/MM/yyyy HH:mm:ss').format(DateTime.parse(date));
  }

  @override
  String? formatNumber(String num) {
    try {
      return double.parse(num).toStringAsFixed(2);
    } catch (e) {
      return '0.00';
    }
  }

  @override
  String realToCoin(String? priceCoin) {
    if (priceCoin == null) return '0';
    try {
      return (1 / double.parse(priceCoin)).toStringAsFixed(8);
    } catch (e) {
      return '0';
    }
  }

  @override
  String? calcRealToCoin(String? priceCoin, String? valueToConvert) {
    if (priceCoin == null || valueToConvert == null) return '0';
    try {
      return (1 / double.parse(priceCoin) * int.parse(valueToConvert))
          .toStringAsFixed(8);
    } catch (e) {
      return '0';
    }
  }

  @override
  String? calcCoinToReal(String? priceCoin, String? valueToConvert) {
    if (priceCoin == null || valueToConvert == null) return '0';
    try {
      return (double.parse(priceCoin) * int.parse(valueToConvert))
          .toStringAsFixed(2);
    } catch (e) {
      return '0';
    }
  }

  @override
  String? formatNumberBitCoin(String number) {
    try {
      return _btcFormatter.format(double.parse(number));
    } catch (e) {
      return _btcFormatter.format(0);
    }
  }

  @override
  String? formatNumberBr(String number) {
    try {
      return _brlFormatter.format(double.parse(number));
    } catch (e) {
      return _brlFormatter.format(0);
    }
  }

  @override
  String? formatNumberUs(String number) {
    try {
      return _usdFormatter.format(double.parse(number));
    } catch (e) {
      return _usdFormatter.format(0);
    }
  }

  String? formatCurrency(String number, String currencyCode) {
    try {
      switch (currencyCode.toUpperCase()) {
        case 'BRL':
          return _brlFormatter.format(double.parse(number));
        case 'USD':
          return _usdFormatter.format(double.parse(number));
        case 'EUR':
          return _eurFormatter.format(double.parse(number));
        case 'BTC':
          return _btcFormatter.format(double.parse(number));
        default:
          return _usdFormatter.format(double.parse(number));
      }
    } catch (e) {
      return _usdFormatter.format(0);
    }
  }
}
