import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/core/failures/errors.dart';
import '../failures/value_failure.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  T getOrCrash() {
    //return value.fold((f) => throw UnexpectedValueError(f), (r)=> r);
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold((f) => left(f), (_) => right(unit));
  }

  bool isValid() => value.isRight();
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
