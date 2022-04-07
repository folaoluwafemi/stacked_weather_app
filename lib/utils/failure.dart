class Failure {
  final String message;

  Failure({
    required this.message,
  });

  @override
  String toString() {
    return 'Failure: $message';
  }


}