import 'package:dartz/dartz.dart';
import 'package:uuid/uuid.dart';

import '../failures/value_failure.dart';
import 'value_object.dart';

class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory UniqueId() {
    return UniqueId._(value: right(const Uuid().v1()));
  }

  factory UniqueId.fromUnique(String id) {
    return UniqueId._(value: right(id));
  }

  const UniqueId._({required this.value});
}
