import 'app_equatable.dart';
import 'failure.dart';

class NetworkFailure extends AppFailure with AppEquatable {
  NetworkFailure(super.message);

  @override
  List<Object?> get props => [message];
}
