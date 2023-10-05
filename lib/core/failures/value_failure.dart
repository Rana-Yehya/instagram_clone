import 'package:freezed_annotation/freezed_annotation.dart';
part 'value_failure.freezed.dart';

@freezed
abstract class ValueFailure<T> implements _$ValueFailure<T> {
  const factory ValueFailure({required T failure}) = _ValueFailure;
}
