part of option;

class None<T> implements Option<T> {

  /**
   * Constant constructor because this is an immutable container
   */
  const None();

  /**
   * Returns true
   *
   * @return {bool} - True
   */
  bool isEmpty() {
    return true;
  }

  /**
   * Returns false
   *
   * @return {bool} - False
   */
  bool nonEmpty() {
    return false;
  }

  /**
   * Always throws an exception
   *
   * @return {T} - The inner value
   * @throws     - Throws everytime
   */
  T get() {
    throw "get should never be called on an Option.None";
  }

  /**
   * Returns the computed value of `alternative`.
   *
   * @param {T|T()} alternative - The value or function of the alternative
   * @return {T}                - The inner value or `alternative`
   */
  T getOrElse(dynamic alternative) {
    if (alternative is Function) {
      return alternative();
    } else {
      return alternative;
    }
  }

  /**
   * Returns the computed value of `alternative`.
   *
   * @param {Option<T>|Option<T>()} alternative - Value or function of alt
   * @return {Option<T>}                        - Original or alternative
   */
  Option<T> orElse(dynamic alternative) {
    if (alternative is Function) {
      return alternative();
    } else {
      return alternative;
    }
  }

  /**
   * Returns `null` when called on `None`
   *
   * @return {T|null} - Inner value on existence null otherwise
   */
  dynamic orNull() {
    return null;
  }

  /**
   * Returns a `Right` type with the supplied `right`
   *
   * @param {dynamic} right    - The right value
   * @return {Either<dynamic>} - The right projection
   */
  Either<dynamic, dynamic> toLeft(dynamic right) {
    return new Right(right);
  }

  /**
   * Returns a `Left` type witht he supplied `left`
   *
   * @param {dynamic} left     - The left value
   * @return {Either<dynamic>} - The left projection
   */
  Either<dynamic, dynamic> toRight(dynamic left) {
    return new Left(left);
  }

  /**
   * Returns  `this`
   *
   * @param {dynamic(T n)}     - Ignored mapper
   * @return {Option<dynamic>} - `this`
   */
  Option<dynamic> map(dynamic mapper(T n)) {
    return this;
  }

  /**
   * Returns  `this`
   *
   * @param {dynamic(T n)}     - Ignored mapper
   * @return {Option<dynamic>} - `this`
   */
  Option<dynamic> flatMap(Option<dynamic> mapper(T n)) {
    return this;
  }

  /**
   * Returns  `this`
   *
   * @param {T(T n)}     - Ignored mapper
   * @return {Option<T>} - `this`
   */
  Option<T> filter(bool predicate(T n)) {
    return this;
  }

  bool operator ==(Option<T> other) {
    return other is None;
  }

  String toString() {
    return "None";
  }

}
