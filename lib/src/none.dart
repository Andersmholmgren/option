part of option;

class None<T> implements Option<T> {

  const None();

  T get() => throw "get should never be called on an Option.None";

  T getOrElse(T alternative()) => alternative();

  T getOrDefault(T alternative) => alternative;

  Option<T> orElse(Option<T> alternative()) => alternative();

  dynamic orNull() => null;

  dynamic cata(dynamic none(), dynamic some(T n)) => none();

  Either<dynamic, dynamic> toLeft(dynamic right) => new Right(right);

  Either<dynamic, dynamic> toRight(dynamic left) => new Left(left);

  Option<dynamic> map(dynamic mapper(T n)) => this;

  Option<dynamic> flatMap(Option<dynamic> mapper(T n)) => this;

  Option<T> filter(bool predicate(T n)) => this;

  bool operator ==(Option<T> other) => other is None;

  String toString() => "None";

}
