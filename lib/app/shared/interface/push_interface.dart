abstract class IPush {
  Future<bool> initOneSignal();
  Future<void> registerUserIdInTag();
  Future<bool> changesPermissions(bool fallbackToSettings);
  void setNotificationOpenHardlerForeground();
  String setRuoterPush(String body);
  Future<bool> clearOneSignal();
  void setAddClickListemer();
  void removeAddClickListemer();
}
