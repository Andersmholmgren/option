part of option;

abstract class Option<T>
    implements Functor<Option<T>>, Applicative<Option>, Monad<Option> {
  /**
   * The factory method for constructing Option values.
   *
   * Given a possibly null value, returns the value wrappend in a Some<T> if the
   * value is non null, returns a None<T> otherwise.
   */
  factory Option(T inner) => inner == null ? const None() : new Some(inner);

  /**
   * An exception unsafe getter of the inner value.
   *
   * Returns the inner value of this is an Option<T> otherwise it will
   * throw an exception.
   */
  T get();

  /**
   * Gets the inner value or returns the result of the alternative computation.
   *
   * If this is an Option<T> then the inner value will be returned, otherwise
   * the result of calling `alternative()` will be returned instead.
   */
  T getOrElse(T alternative());

  /**
   * Gets the inner value or the supplied alternative.
   *
   * If this is an Option<T> then the inner value will be returned, otherwise
   * the supplied alternative will be returned instead.
   */
  T getOrDefault(T alternative);

  /**
   * Returns an Option<T> form an alternative computation if empty.
   *
   * If this is an Option<T> this method will just return itself. If this is
   * a None<T> this method will return the Option<T> returned from calling
   * the supplied alternative computation.
   */
  Option<T> orElse(Option<T> alternative());

  /**
   * Downcasts this value back down to null land.
   *
   * Returns the inner value if this is a Some<T> otherwise it returns null.
   */
  dynamic orNull();

  /**
   * Performs a cata/fold on the current Option<T> with the supplied functions.
   *
   * If this is a None<T> none() will be called and it's result will be
   * returned. If this is a Some<T> then some(n) will be called with the inner
   * value and it's result will be returned instead.
   */
  dynamic cata(dynamic none(), dynamic some(T n));

  /**
   * Converts this Option<T> to an Either.
   *
   * If this is a Some<T> then a Left will be returned containing the inner
   * wrapped value. Otherwise a Right will be returned containing the supplied
   * right value.
   */
  Either<dynamic, dynamic> toLeft(dynamic right);

  /**
   * Converts this Option<T> to an Either.
   *
   * If this is a Some<T> then a Right will be returned containing the inner
   * wraped value. Otherwise a Left will be returned containing the supplied
   * left value.
   */
  Either<dynamic, dynamic> toRight(dynamic left);

  /**
   * Performs a filter operation with the supplied predicate.
   *
   * If this is a Some<T> then the predicate will be applied to the inner
   * wrapped value and if the predicate passes the Some<T> will be returned.
   * Otherwise a None<T> will be returned. If this is a None<T> then the
   * None<T> will be returned immediately.
   */
  Option<T> filter(bool predicate(T n));

  Option<dynamic /*=R*/ > map /*<R>*/ (/*=R*/ mapper(T n));

  Option<dynamic /*=R*/ > expand /*<R>*/ (
      Option<dynamic /*=R*/ > expander(T n));
}
