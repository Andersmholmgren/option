import "package:unittest/unittest.dart";
import "package:option/option.dart";

main () {
  
  test("create Some by Option factory constructor", () {
    expect(new Option(20) is Some, isTrue);
    expect(new Option(20), isNot(same(new Option(20))),
        reason: "Some is not constant if it is created by Option factory constructor.");
  });
  
  test("create None by Option factory costructor", () {
    expect(new Option(null) is None, isTrue);
    expect(new Option(null), same(new Option(null)), reason: "None is constant.");
  });
}

