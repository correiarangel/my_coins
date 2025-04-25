import 'package:intl/intl.dart';
import '../interface/format_interface.dart';

class FormatService implements IFormat {
  // Decimal formatador para pt_BR com exatamente 2 casas decimais
  final NumberFormat _decimalPtBr = NumberFormat.decimalPattern('pt_BR')
    ..minimumFractionDigits = 2
    ..maximumFractionDigits = 2;

  // Formatadores de moeda
  late final Map<String, NumberFormat> _currencyFormatters = {
    'BRL': NumberFormat.simpleCurrency(locale: 'pt_BR'),
    'USD': NumberFormat.simpleCurrency(locale: 'en_US'),
    'EUR': NumberFormat.simpleCurrency(locale: 'de_DE', name: 'EUR'),
    'BTC': NumberFormat.currency(locale: 'en_US', symbol: '₿', decimalDigits: 8),
  };

  @override
  String? formatNtpHour(DateTime? date) {
    if (date == null) return null;
    return DateFormat('yyyy-MM-dd HH:mm').format(date);
  }

  @override
  String? toBrazilTime(String? date) {
    if (date == null) return null;
    try {
      return DateFormat('dd/MM/yyyy HH:mm:ss')
          .format(DateTime.parse(date));
    } catch (_) {
      return null;
    }
  }

  @override
  String? formatNumber(String numStr) {
    try {
      final value = double.parse(numStr);
      return _decimalPtBr.format(value);
    } catch (_) {
      return _decimalPtBr.format(0);
    }
  }

  @override
  String realToCoin(String? priceCoin) {
    try {
      final rate = priceCoin == null ? 0.0 : double.parse(priceCoin);
      if (rate == 0) return '0';
      return (1 / rate).toStringAsFixed(8);
    } catch (_) {
      return '0';
    }
  }

  @override
  String? calcRealToCoin(String? priceCoin, String? valueToConvert) {
    try {
      final rate = priceCoin == null ? 0.0 : double.parse(priceCoin);
      final amount = int.tryParse(valueToConvert ?? '') ?? 0;
      if (rate == 0) return '0';
      return (amount / rate).toStringAsFixed(8);
    } catch (_) {
      return '0';
    }
  }

  @override
  String? calcCoinToReal(String? priceCoin, String? valueToConvert) {
    try {
      final rate = priceCoin == null ? 0.0 : double.parse(priceCoin);
      final amount = int.tryParse(valueToConvert ?? '') ?? 0;
      final result = rate * amount;
      return _decimalPtBr.format(result); // ✅ Formatação correta em pt-BR
    } catch (_) {
      return _decimalPtBr.format(0);
    }
  }

  @override
  String? formatNumberBitCoin(String number) {
    try {
      return _currencyFormatters['BTC']!.format(double.parse(number));
    } catch (_) {
      return _currencyFormatters['BTC']!.format(0);
    }
  }

  @override
String? formatNumberBr(String number) {
  try {
    final double value = double.tryParse(number.replaceAll(",", ".")) ?? 0;
    return _currencyFormatters['BRL']!.format(value);
  } catch (_) {
    return _currencyFormatters['BRL']!.format(0);
  }
}


  @override
  String? formatNumberUs(String number) {
    try {
      return _currencyFormatters['USD']!.format(double.parse(number));
    } catch (_) {
      return _currencyFormatters['USD']!.format(0);
    }
  }

  @override
  String? formatCurrency(String number, String currencyCode) {
    try {
      final code = currencyCode.toUpperCase();
      final formatter = _currencyFormatters[code] ?? _currencyFormatters['USD']!;
      return formatter.format(double.parse(number));
    } catch (_) {
      return _currencyFormatters['USD']!.format(0);
    }
  }
}
