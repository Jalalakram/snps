import 'dart:math' as Math;

//--------------------- Iterables Collection -----------------------
//@ https://www.youtube.com/watch?v=bsvZgW5_b8w&feature=emb_logo

void iterable() {
final aListOfInts = <int>[];
final aSetOfInts = <int>{};
final aMapOfIntToDouble = <int, double>{};

final aList = ['one', 'two', 'three'];         //# Inferred as List
final aSet = {'one', 'two', 'three'};          //# Inferred as Set
final aMap = {'one': 1, 'two': 2, 'three': 3}; //# Inferred as Map

  var numbers = Iterable.generate(10, (i) => i+1-1);
  
  numbers.forEach((n) => print(n));

  // for (var n in numbers) { print(n); }
  var sum = 0;    for (var x in numbers) { sum += x; }   print(sum);

  print(numbers.reduce((value, n) => value + n));

  var varList = numbers.toList();         print('$varList ...List');
  var varSet = numbers.toSet();           print('$varSet ...Set');
  var varString = numbers.toString();     print('$varString ...String');

  print(numbers.first.toString() + ' First');
  print(numbers.last.toString() + ' Last');

  print(numbers.skip(5).toList());
  print(numbers.takeWhile((n) => n < 5).toList());     //# takeWile is Lazy
  print(numbers.takeWhile((n) => n % 2 == 0).toList());//# And Stops upon Null Value

  print(numbers.any((n) => n % 2 ==0));
  print(numbers.every((n) => n % 2 == 0));

  //------------------ reduce() map() where() ----------------------
  print(numbers.where((n) => n % 2 == 0).toList());

  print(numbers.take(10).map((n) => n * 10).toList());

  print(numbers.reduce(Math.min));
  print(numbers.reduce(Math.max));

  Map<int, int> map = Map.fromIterable( numbers.take(10),);
  print(map);
  print(map[0]);
  print(map[9]);

  print(map.map((int k, int v) => MapEntry(k, k + v),));

  // numbers.reduce();
  // numbers.map();
  // numbers.where();






}