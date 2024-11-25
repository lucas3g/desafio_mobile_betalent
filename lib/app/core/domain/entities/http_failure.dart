import 'app_equatable.dart';
import 'failure.dart';

class HttpFailure extends AppFailure with AppEquatable {
  final dynamic error;
  final int? statusCode;

  HttpFailure({
    String? message,
    this.error,
    this.statusCode,
  }) : super(message ?? 'Connection with the server lost!');

  @override
  List<Object?> get props => [message, error, statusCode];
}
