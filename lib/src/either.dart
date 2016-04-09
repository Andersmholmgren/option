part of either;

abstract class Either<L, R> {

  const Either();

  bool isLeft();

  bool isRight();

  dynamic cata(dynamic leftCase(L left), dynamic rightCase(R right));

  Either<L, dynamic> map(dynamic mapper(R n));

  Either<dynamic, dynamic> flatMap(Either<dynamic, dynamic> flatMapper(R n));

  Option<L> left();

  Option<R> right();

  Either<R, L> swap();

}