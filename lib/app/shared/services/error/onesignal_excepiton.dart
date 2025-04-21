abstract class IOneSignalException implements Exception {
  final String message;
  final StackTrace stackTrace;

  IOneSignalException({
    required this.message,
    required this.stackTrace,
  });
}

class OneSignalException extends IOneSignalException {
  OneSignalException({required super.message, required super.stackTrace});
}
