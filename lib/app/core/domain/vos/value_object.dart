import '../entities/app_equatable.dart';
import '../entities/either_of.dart';

abstract class ValueObject<T> with AppEquatable {
  final T value;

  const ValueObject(this.value);

  EitherOf<String, ValueObject<T>> validate([Object? object]);

  @override
  String toString() {
    return '$runtimeType: $value';
  }

  @override
  List<Object?> get props => [value];
}
