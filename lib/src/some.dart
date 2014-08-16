part of option;

class Some<T> implements Option<T> {

  final T _inner;

  const Some(this._inner);

  T get() => _inner;

  T getOrElse(T alternative()) => _inner;

  T getOrDefault(T alternative) => _inner;

  Option<T> orElse(Option<T> alternative()) => this;

  dynamic orNull() => _inner;

  dynamic cata(dynamic none(), dynamic some(T n)) => some(_inner);

  Either<dynamic, dynamic> toLeft(dynamic right) => new Left(_inner);

  Either<dynamic, dynamic> toRight(dynamic left) => new Right(_inner);

  Option<dynamic> map(dynamic mapper(T n)) => new Some(mapper(_inner));

  Option<dynamic> flatMap(Option<dynamic> flatMapper(T n)) =>
    flatMapper(_inner);

  Option<T> filter(bool predicate(T n)) =>
    predicate(_inner)
      ? this
      : const None();

  bool operator ==(Option<T> other) =>
    (other is Some) && (other as Some).get() == get();

  String toString() => "Some($_inner)";

}
