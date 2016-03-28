part of either;

class Right<L, R> extends Either<L, R> {

  final R _inner;

  const Right(this._inner);

  bool isLeft() => false;

  bool isRight() => true;

  dynamic cata(dynamic leftCase(L left), dynamic rightCase(R right)) =>
    rightCase(this._inner);

  Either<L, dynamic> map(dynamic mapper(R n)) =>
    new Right(mapper(this._inner));

  Either<dynamic, dynamic> flatMap(Either<dynamic, dynamic> flatMapper(R n)) =>
    flatMapper(this._inner);

  Option<L> left() => new None<L>();

  Option<R> right() => new Some(this._inner);

  Either<R, L> swap() => new Left(this._inner);

}