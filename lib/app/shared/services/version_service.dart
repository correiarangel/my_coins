import 'dart:developer';

import 'package:package_info_plus/package_info_plus.dart';

import '../interface/version_interface.dart';

class VersionService implements IVersion {
  @override
  Future<String>? getBuildAndVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    var result = '';
    try {
      result = '${packageInfo.version}+${packageInfo.buildNumber}';
    } on Exception catch (e, s) {
      log('ERROR getBuildAndVersion', error: e, stackTrace: s);
      result = '';
    }
    return result;
  }
}
