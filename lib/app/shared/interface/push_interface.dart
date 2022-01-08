abstract class IPush {
  Future<String> initOneSignal();
  Future<String> removeUser();
  Future<String> registerUserIdInTag();
  dynamic setNotificationOpHandler();
  Future setNotificationOpenHardler();
  Future<String> setRuoterPush({required String body});
  Future<bool> changesPermissions();
}
