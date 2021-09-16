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
          debugPrint('Há internet..............');
          isNet = true;
        } else {
          debugPrint('Não Há internet..............');
          isNet = false;
        }
      } catch (e) {
        debugPrint('Não Há internet..............');
        debugPrint('Erro test net $e');
        isNet = false;
      }
    } else {
      debugPrint('VERSION  @@@@ ${Platform.version}');
      isNet = true;
    }

    return isNet;
  }
}
