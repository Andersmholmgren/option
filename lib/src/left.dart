part of either;

class Left<L, R> extends Either<L, R> {

  final L _inner;

  const Left(this._inner);

  bool isLeft()  => true;

  bool isRight() =>  false;

  dynamic cata(dynamic leftCase(L left), dynamic rightCase(R right)) =>
    leftCase(this._inner);

  Either<L, dynamic> map(dynamic mapper(R n))  => this;

  Either<dynamic, dynamic> flatMap(Either<dynamic, dynamic> flatMapper(R n)) =>
    this;

  Option<L> left() => new Some(this._inner);

  Option<R> right() => new None<R>();

  Either<R, L> swap() => new Right(this._inner);

}