import 'package:desafio_mobile_betalent/app/core/domain/entities/app_equatable.dart';

import 'either_of.dart';
import 'failure.dart';

abstract class UseCase<ReturnType, Args> {
  Future<EitherOf<AppFailure, ReturnType>> call(Args args);
}

abstract class StreamUsecase<ReturnType, Args> {
  Stream<EitherOf<AppFailure, ReturnType>> call(Args args);
}

class NoArgs with AppEquatable {
  const NoArgs();

  @override
  List<Object?> get props => [];
}
