part of option;

class None<T> extends IterableBase<T> implements Option<T> {

  /**
   * The const constructor for the None<T> type.
   */
  const None();

  /**
   * This method will always throw unconditionally.
   */
  T get() => throw "get should never be called on an Option.None";

  /**
   * Returns the result of the alternative computation.
   */
  T getOrElse(T alternative()) => alternative();

  /**
   * Returns the alternative value.
   */
  T getOrDefault(T alternative) => alternative;

  /**
   * Returns the result of the alternative computation.
   */
  Option<T> orElse(Option<T> alternative()) => alternative();

  /**
   * Always returns null.
   */
  dynamic orNull() => null;

  /**
   * Returns the result of the `none()` computation.
   */
  dynamic cata(dynamic none(), dynamic some(T n)) => none();

  /**
   * Returns a Right with the supplied right value.
   */
  Either<dynamic, dynamic> toLeft(dynamic right) => new Right(right);

  /**
   * Returns a Left with the supplied left value.
   */
  Either<dynamic, dynamic> toRight(dynamic left) => new Left(left);

  /**
   * Always returns itself.
   */
  Option<dynamic /*=R*/ > map /*<R>*/ (/*=R*/ mapper(T n)) => const None<dynamic /*=R*/ >();

  /**
   * Always returns itself.
   */
  Option<dynamic> ap(Option<dynamic> other) => this;

  /**
   * Always returns itself.
   */
  Option<dynamic> expand(Option<dynamic> expand(T n)) => this;

  /**
   * Always returns itself.
   */
  Option<T> filter(bool predicate(T n)) => this;

  /**
   * The equality operator.
   */ 
  bool operator ==(Option<T> other) => other is None;

  /**
   * Returns the string "None"
   */
  String toString() => "None";

  @override
  Iterator<T> get iterator => new Iterable<T>.empty().iterator;
}
