abstract class Failure {
  String? message;
}

class EmailLogFailure implements Failure {
  @override
  String? message = "Something went wrong";
}
