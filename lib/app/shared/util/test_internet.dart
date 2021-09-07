import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';

import '../interface/test_internet_interface.dart';

class TestInternet implements ITestInternet {
  TestInternet();

  @override
  Future<bool>? isInternet() async {
    bool? isNet;
    try {
      final result = await InternetAddress.lookup('www.google.com.br')
          .timeout(Duration(seconds: 10));
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //print('Há internet..............');
        isNet = true;
      } else {
        //print('Não Há internet..............');
        isNet = false;
      }
    } on TimeoutException catch (e) {
      debugPrint('Erro test net ${e.message}');
      throw TimeoutException(e.message);
    }
    return isNet;
  }
}
