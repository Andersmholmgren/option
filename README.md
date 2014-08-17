# Option

[![Build Status](https://drone.io/github.com/JosephMoniz/dart-option/status.png)](https://drone.io/github.com/JosephMoniz/dart-option/latest)

The option typeclass inspired by scala's implementation and Haskell's Maybe
monad. In more OOP languages it's been known to go by the name of the
[null object pattern](http://en.wikipedia.org/wiki/Null_Object_pattern).
Option is a composable and more expressive alternative to things that
may be null on absence of value. When used prolifically in a code base
it means that you should never have to manually check for null again because
this edge case will always be codified and enforced via the type system.

Speaking at a conference in 2009 Tony Hoare, the creator of the null reference
apologized for it's creation, calling it his
[billion dollar mistake](http://en.wikipedia.org/wiki/Tony_Hoare#Apologies_and_retractions).
In his own words, his introduction of null "... has led to innumerable errors,
vulnerabilities, and system crashes, which have probably caused a billion
dollars of pain and damage in the last forty years."

## Examples

### Nested Null Checking

The Option<T> type is all about taking null check riddled code like the
following:
```dart
int compoute(Foo foo) {
  if (foo == nul) {
    return null;
  }
  
  final bar = foo.getBar();
  if (bar == null) {
    return null;
  }
  
  final baz = bar.getBaz();
  if (baz == null) {
    return null;
  }
  
  return baz.compute();
}
```

With the much cleaner and easier to comprehend composition instead:
```dart
int compute(Option<Foo> optionalFoo) {
  return optionalFoo
    .flatMap((Foo foo) => foo.getBar())
    .flatMap((Bar bar) => bar.getBaz())
    .flatMap((Baz baz) => baz.compute());
}
```

### Downcasting Back Down To Null Land

Unfortunately, not every library you use is going to be expecting Option<T>
values. So we give you a means of "downcasting" your Option<T> values to their
flat type equivelent or null

```dart
int compute(Option<Foo> optionalFoo) {
  final intOrNull = optionalFoo.map((Foo) => foo.getInt()).orNull();
  return expectsIntOrNull(intOrNull);
}
```

### Sane Defaults On Null

Some times you want to unwrap the value contained within an Option<T> and if
that inner value doesn't exist (it's a None<T>) you want to set it to a sane
default value instead, you can use either Option#getOrDefault(T) or
Option#getOrElse(T alt()).

Heres how you would default to the value zero on null.
```dart
int compute(Option<Foo> optionalFoo) {
  return optionalFoo
    .flatMap((Foo foo) => foo.getBar())
    .flatMap((Bar bar) => bar.getBaz())
    .flatMap((Baz baz) => baz.compute())
    .getOrDefault(0);
}
```

Heres how you would default to a lazily executed alternative computation
on null.
```dart
int compute(Option<Foo> optionalFoo) {
  return optionalFoo
    .flatMap((Foo foo) => foo.getBar())
    .flatMap((Bar bar) => bar.getBaz())
    .flatMap((Baz baz) => baz.compute())
    .getOrElse(() => alternativeComputation(optionalFoo));
}
```

### Anonymous Filtering/Validation

Some times you need to perform some filtering or validation on a value
and you don't necessarily care exactly what part fails, just that it passes
all filters or that it doesn't.

```dart
final emailRegex = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

bool minLength(int length, String string) {
  return string.length >= length;
}

bool matchesRegex(RegExp regex, String string) {
  return regex.hasMatch(string));
}

Option<String> validateEmail(String email) {
  return new Option(email)
    .filter((email) => minLength(4, email))
    .filter((email) => matchesRegex(new RegExp(emailRegex), email))
}
```

### Pattern Matching / Folding / Catamorphism

Some times you'll have an Option<T> value and you want just want to do one
computation if it's empty and another if it's non empty with the contained
value and return the result of either case. In the null checking world this
would be facilitated via an "is null" check. However, instead we do a rough
approximation of what other languages call pattern matching by using a technique
that functional programmers call "Folding" or "Catamorphism". We supply the
Option<T> value with two functions, one which will run in either case and we
pass them to the Option#cata() method.

```dart
bool nonEmptyValidator(Option<String> input)  {
  return input.cata(
    ()  => false,
    (n) => n.length > 0
  );
}
```
