import 'failure.dart';

class HttpFailure extends AppFailure {
  final dynamic error;
  final int? statusCode;

  HttpFailure({
    String? message,
    this.error,
    this.statusCode,
  }) : super(message ?? 'Connection with the server lost!');

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }

    return other is HttpFailure &&
        other.error == error &&
        other.statusCode == statusCode;
  }

  @override
  int get hashCode => error.hashCode ^ statusCode.hashCode;
}
