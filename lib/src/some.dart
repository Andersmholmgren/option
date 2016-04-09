part of option;

class Some<T> extends IterableBase<T> implements Option<T> {
  final T _inner;

  /**
   * The const constructor for this object
   */
  const Some(this._inner);

  /**
   * Returns the inner wrapped value.
   */
  T get() => _inner;

  /**
   * Returns the inner wrapped value.
   */
  T getOrElse(T alternative()) => _inner;

  /**
   * Returns the inner wrapped value.
   */
  T getOrDefault(T alternative) => _inner;

  /**
   * Always returns itself.
   */
  Option<T> orElse(Option<T> alternative()) => this;

  /**
   * Returns the inner wrapped value.
   */
  dynamic orNull() => _inner;

  /**
   * Returns the result of calling `some(n)` with the inner wrapped value.
   */
  dynamic cata(dynamic none(), dynamic some(T n)) => some(_inner);

  /**
   * Returns a Left containing the inner wrapped value.
   */
  Either<dynamic, dynamic> toLeft(dynamic right) => new Left(_inner);

  /**
   * Returns a Right containing the inner wrapped value.
   */
  Either<dynamic, dynamic> toRight(dynamic left) => new Right(_inner);

  /**
   * Returns a new Some containing the value of applying mapper to the
   * inner wrapped value.
   */
  Option<dynamic/*=R*/ > map/*<R>*/(/*=R*/ mapper(T n)) =>
      new Some/*<R>*/(mapper(_inner));

  /**
   * Returns the result of applying this wrapped function to the
   * next applicative.
   */
  Option<dynamic> ap(Option<dynamic> other) => other.map(_inner as Function);

  /**
   * Returns the result of calling the supplied flatMapper with the
   * inner wrapped value.
   */
  Option<dynamic/*=R*/ > expand/*<R>*/(Option<dynamic/*=R*/ > expander(T n)) =>
      expander(_inner);

  /**
   * Applies the predicate to the inner wrapped value, if it's true it returns
   * itself, None<T> otherwise.
   */
  Option<T> filter(bool predicate(T n)) =>
      predicate(_inner) ? this : const None();

  /**
   * The equality operator.
   */
  bool operator ==(Option<T> other) =>
      (other is Some) && (other as Some).get() == get();

  /**
   * Returns the string representation of this object
   */
  String toString() => "Some($_inner)";

  @override
  Iterator<T> get iterator => <T>[_inner].iterator;
}
