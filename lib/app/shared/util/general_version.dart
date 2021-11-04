import 'package:package_info/package_info.dart';

import '../interface/general_version_interface.dart';

class GeneralVersion implements IGeneralVersion {
  @override
  Future<String?>? getBuildAndVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    var result = '';
    try {
      result = '${packageInfo.version}+${packageInfo.buildNumber}';
    } on Exception catch (_) {
      result = '';
    }
    return result;
  }
}
