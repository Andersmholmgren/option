part of option;

abstract class Option<T> {

  /**
   * Returns true if type is `None` returns false if type is `Some`
   *
   * @return bool - Result of the empty check
   */
  bool isEmpty();

  /**
   * Returns false if type is `None` returns true if type is `Some`
   *
   * @return bool - Result of the non-empty check
   */
  bool nonEmpty();

  /**
   * Returns the inner value of the `Option` when called with a `Some`.
   * When called with a `None` this method throws an exception.
   *
   * @return T - The inner value
   * @throws   - Throws when called on `None`
   */
  T get();

  /**
   * Returns the inner value if it exists, otherwise it returns the
   * computed value of `alternative`.
   *
   * @param T|T() alternative - The value or function of the alternative
   * @return T                - The inner value or `alternative`
   */
  T getOrElse(dynamic alternative);

  /**
   * Returns the current `Option` if it's called on a `Some`, otherwise it
   * returns the computed value of `alternative`.
   *
   * @param Option<T>|Option<T>() alternative - Value or function of alt
   * @return Option<T>                        - Original or alternative
   */
  Option<T> orElse(dynamic alternative);

  /**
   * Returns the inner value when called on `Some`. Returns `null`
   * when called on `None`
   *
   * @return T|null - Inner value on existence null otherwise
   */
  dynamic orNull();

  /**
   * Returns a `Left` projection of this `Option` type. If this `Option`
   * type is `Some` the inner value is returned wrapped in a `Left`. If
   * this `Option` type is `None` the supplied `right` value will be
   * returned wrapped in a `Right` type.
   *
   * @param dynamic right    - The right value if this option is empty
   * @return Either<dynamic> - The left projection
   */
  Either<dynamic, dynamic> toLeft(dynamic right);

  /**
   * Returns a `Right` projection of this `Option` type. If this `Option`
   * type is `Some` the inner value is returned wrapped in a `Right`. If
   * this `Option` type is `None` the supplied `left` value will be
   * returned wrapped in a `Left` type.
   *
   * @param dynamic right    - The left value if this option is empty
   * @return Either<dynamic> - The right projection
   */
  Either<dynamic, dynamic> toRight(dynamic left);

  /**
   * Applies the `mapper` to the inner value and wraps the result of
   * the mapper in a new `Option<T>` and returns the new `Option<T>`.
   * If the current `Option` is `None` this function just returns `this`
   *
   * @param dynamic(T n)     - Mapper to apply to inner value if any.
   * @return Option<dynamic> - The mapped result
   */
  Option<dynamic> map(dynamic mapper(T n));

  /**
   * Applies the `flatMapper` to the inner value and returns the new
   * `Option` returned by the `flatMapper`
   *
   * @param Option<dynamic>(T n) flatMapper - Flat mapper to apply
   * @return Option<dynamic>                - The result of the flat map
   */
  Option<dynamic> flatMap(Option<dynamic> flatMapper(T n));

  /**
   * Applies predicate to the inner value when called on `Some` and
   * if the predicate passes the current `Some` is returned but if
   * it fails it returns a new instance of `None`. When called on
   * `None` this function just returns an instance of `this`
   *
   * @param bool(T n) predicate - Predicate to apply
   * @return Option<T>          - Result of predicate test
   */
  Option<T> filter(bool predicate(T n));

}
