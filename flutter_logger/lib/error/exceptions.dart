abstract class MyException implements Exception {
  String message = 'Something went wrong';
}

class EmailLogException implements MyException {
  @override
  String message = 'Something went wrong';
}
