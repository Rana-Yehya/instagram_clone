import 'value_failure.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);
  @override
  String toString() {
    const explanation = 'An error has occured. Terminating.';
    return Error.safeToString('$explanation. Failure was $valueFailure');
  }
}
class AuthenticationError extends Error {}