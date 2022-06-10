abstract class LogFileProvider {
  Future<String> createLogFile();
  //Future<String> getLogFilePath();
  Future<void> insertLog({required String log});
}