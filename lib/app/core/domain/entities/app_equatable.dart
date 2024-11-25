// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';

mixin AppEquatable {
  List<Object?> get props;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    if (other.runtimeType != runtimeType) return false;

    if (other is AppEquatable) {
      return const DeepCollectionEquality().equals(other.props, props);
    }

    return false;
  }

  @override
  int get hashCode => const DeepCollectionEquality().hash(props);
}
