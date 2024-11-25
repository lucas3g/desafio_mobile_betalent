import 'package:desafio_mobile_betalent/app/core/domain/entities/app_equatable.dart';

import 'failure.dart';

class NetworkFailure extends AppFailure with AppEquatable {
  NetworkFailure(super.message);

  @override
  List<Object?> get props => [message];
}
