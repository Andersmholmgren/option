part of option;

abstract class Option<T> {

  factory Option(T inner) => (inner == null) ? const None() : new Some(inner);

  T get();

  T getOrElse(T alternative());

  T getOrDefault(T alternative);

  Option<T> orElse(Option<T> alternative());

  dynamic orNull();

  dynamic cata(dynamic none(), dynamic some(T n));

  Either<dynamic, dynamic> toLeft(dynamic right);

  Either<dynamic, dynamic> toRight(dynamic left);

  Option<dynamic> map(dynamic mapper(T n));

  Option<dynamic> flatMap(Option<dynamic> flatMapper(T n));

  Option<T> filter(bool predicate(T n));

}
