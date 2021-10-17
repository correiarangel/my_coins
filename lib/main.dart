import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'app/shared/services/http_overrides.dart';

void main() {
   HttpOverrides.global =  MyHttpOverrides();
  
  return runApp(
    ModularApp(
      module: AppModule(),
      child: AppWidget(),
    ),
  );
}
