import "package:unittest/unittest.dart";
import "package:option/option.dart";

optionTests() {
  group("Option Test:", () {

    test("Create Some by Option factory constructor", () {
      expect(new Option(20) is Some, isTrue);
      expect(new Option(20), isNot(same(new Option(20))),
          reason: "Some is not constant when created by Option factory ctor."
      );
    });

    test("Create None by Option factory costructor", () {
      expect(new Option(null) is None, isTrue);
      expect(new Option(null), same(new Option(null)),
          reason: "None is constant."
      );
    });

  });
}

noneTests() {
  group("None Test:", () {
    var instance = new None<bool>();

    test("get() should throw", () {
      expect(() => instance.get(), throws);
    });

    test("getOrDefault() should return alternative", () {
      expect(instance.getOrDefault(false), equals(false));
    });

    test("getOrElse() should run and return alternative", () {
      expect(instance.getOrElse(() => false), equals(false));
    });

    test("orElse() should run and return alternative option", () {
      var alternative = new Some<bool>(true);
      var result      = instance.orElse(() => alternative);
      expect(result is Some<bool>, isTrue);
      expect(result.get(), equals(true));
    });

    test("orNull() should return null", () {
      expect(instance.orNull(), isNull);
    });

    test("toRight() should return Left", () {
      var result = instance.toRight(3).cata(
        (e) => true,
        (s) => false
      );
      expect(result, isTrue, reason: "toRight on None returned a Right");
    });

    test("toLeft() should return Right", () {
      var result = instance.toLeft(3).cata(
        (e) => false,
        (s) => true
      );
      expect(result, isTrue, reason: "toLeft on None returned a Left");
    });

    test("map() should return an instance of None", () {
      expect(instance.map((e) => e) is None, isTrue);
    });

    test("expand() should return an instance of None", () {
      expect(instance.expand((e) => new Some(e)) is None, isTrue);
    });

    test("filter() should return an instance of None", () {
      expect(instance.filter((e) => true) is None, isTrue);
    });

    test("== None should return true", () {
      expect(instance == new None(), isTrue);
    });

    test("== Some should return false", () {
      expect(instance == new Some(3), isFalse);
    });

    test("toString() should return None", () {
      expect(instance.toString(), equals("None"));
    });

  });
}

someTests() {
  group("Some Test:", () {
    var instance = new Some<int>(3);

    test("get() should return inner value", () {
      expect(instance.get(), equals(3));
    });

    test("getOrDefault() should return inner value", () {
      expect(instance.getOrDefault(6), equals(3));
    });

    test("getOrElse() should return inner value", () {
      expect(instance.getOrElse(() => 6), equals(3));
    });

    test("orElse() should return this Some instance", () {
      var result = instance.orElse(() => new None());
      expect(result is Some, isTrue);
      expect(result.get(), equals(3));
    });

    test("toLeft() should return Left of this inner value", () {
      var result = instance.toLeft(6).cata(
        (e) => true,
        (s) => false
      );
      expect(result, isTrue, reason: "toLeft on Some returned a Right");
    });

    test("toRight() should return Right of this inner value", () {
      var result = instance.toRight(6).cata(
        (e) => false,
        (s) => true
      );
      expect(result, isTrue, reason: "toRight on Some returned a Left");
    });

    test("map() should apply mapper to inner value and return Some", () {
      var result = instance.map((v) => v * 2);
      expect(result is Some, isTrue);
      expect(result.get(), equals(6));
    });

    test("expand() should apply expander and return new Option", () {
      var result = instance.expand((v) => new Some(v * 2));
      expect(result is Some, isTrue);
      expect(result.get(), equals(6));
    });

    test("filter() should return None when predicate fails", () {
      var result = instance.filter((v) => false);
      expect(result is None, isTrue);
    });

    test("filter() should return this Some when predicate passes", () {
      var result = instance.filter((v) => true);
      expect(result is Some, isTrue);
      expect(result.get(), equals(3));
    });

    test("== None should return false", () {
      expect(instance == new None(), isFalse);
    });

    test("== Some(6) should return true", () {
      expect(instance == new Some(6), isFalse);
    });

    test("== Some(3) should return true", () {
      expect(instance == new Some(3), isTrue);
    });

    test("toString() should return Some(3)", () {
      expect(instance.toString(), "Some(3)");
    });

  });
}

main() {

  optionTests();
  noneTests();
  someTests();

}