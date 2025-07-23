sealed class Result<T, TException> {
  const Result();
  const factory Result.ok(T data) = Ok<T, TException>._;
  const factory Result.exception(TException exception) =
      Exception<T, TException>._;
}

final class Exception<T, TException> extends Result<T, TException> {
  final TException exception;

  const Exception._(this.exception);
}

final class Ok<T, TException> extends Result<T, TException> {
  final T data;
  const Ok._(this.data);
}
