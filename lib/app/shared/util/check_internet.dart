import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import '../interface/check_internet_interface.dart';

class CheckInternet implements ICheckInternet {
  
  @override
  Future<bool>? isInternet() async {
  
    bool? isNet;
    if (Platform.isAndroid || Platform.isIOS) {
      try {
        final result = await InternetAddress.lookup('www.google.com.br')
            .timeout(Duration(seconds: 10));

        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          isNet = true;
        } else {
          isNet = false;
        }
      } catch (e) {
        debugPrint('Erro test net $e');
        isNet = false;
      }
    } else {
      isNet = true;
    }

    return isNet;
  }
}
