import 'dart:collection';

//# Article Link: https://dev.to/graphicbeacon/top-10-mapobject-utility-methods-you-should-know-dart--1ido
//# Top 10 Map/Object utility methods you should know (Dart)

//# Un-Ordered
//# Add-Remove
//# Keys are Unique
void maps() {
  print('-------CREATE------');       create(); 
  print('-------ACCESS------');       access(); 
  print('-------ADD-REMOVE------');   addremove(); 
  print('-------MERGE-------');       merge();
  print('-------ITERATE-------');     iterate();
  print('-------SORT-------');        sort();
  print('-------TRANSFORM-------');   transform();  
  print('-------UPDATE-------');      update();
}

void create() {
  //# Method 1 - Using Literal
  Map<String, int> countryCode = {
    "USA": 1,
    "UK": 42,
    "Pakistan": 92
  };

  //# Method 2 - Using Constructor
  Map<String, String> fruits = Map();
  fruits["apple"] = "red";
  fruits["banana"] = "yellow";
  fruits["guava"] = "green";

  fruits.containsKey("apple");                //# returns true if the KEY is present in Map
	fruits.update("apple", (value) => "green"); //# Update the VALUE for the given KEY
	fruits.remove("apple");                     //# removes KEY and it's VALUE and returns the VALUE
	fruits.isEmpty;                             //# returns true if the Map is empty
	fruits.length;                              //# returns number of elements in Map
	fruits.clear();                             //# Deletes all elements

	print(fruits["apple"]);                     //# Output: red

  //# Print all keys
	for (String key in fruits.keys) {           //# Output: 
		print(key);
	}
  //# Print all values
	for (String value in fruits.values) {       
		print(value);
	}

  //# Using Lambda
	fruits.forEach((key, value) => print("key: $key and value: $value"));   

  //# Map Types: LinkedHashMap, HashMap, SplayTreeMap
  var mapA = {'zero':0, 10:'X'}; // Declare W/O types & Inffered
  Map mapB = {'zero':0, 10:'X'}; // Declare W/O types
  if (mapB is LinkedHashMap) {
    print(mapA); print("Default map is a LinkedHashMap.");
  }
  
  Map<String, int> map1 = {'Jack': 23, 'Adam': 27};
  Map map2 = Map.from(map1);  //# Map Using from()
  Map map3 = Map.of(map1);    //# Map Using of()
  print(map2); print(map3);
  
  // Map<int, String> map = {1: 'one', 2: 'two'}; // ? int & String.
  // Map<int, int> map1 = Map.from(map); //# Wrong Types Runtime err.
  // Map<int, int> map2 = Map.of(map);   //# Wrong Types Compile err.
  
  List<String> letters = ['I', 'V', 'X'];
  List<int> nums = [1, 5, 10];
  Map mapI = Map.fromIterables(letters, nums);
  print(mapI); // Output: {I: 1, V: 5, X: 10}
  
  Map<String, int> map2X = Map.fromIterable(
    nums, key: (k) => '2X'+k.toString(),value: (v) => v*2);
  print(map2X);         //Computed Keys, values
  // Output: {2X1: 2, 2X5: 10, 2X10: 20}
}

void access() {
  Map<int, String> map = {1: 'one', 2: 'two', 3: 'three'};
  print(map.length);      // 3
  print(map.isEmpty);     // false
  print(map.isNotEmpty);  // true
  print(map.keys);        // (1, 2)
  print(map.values);      // (one, two)
  print(map[2]);          // two
  print(map[4]);          // null
  
  print(map.containsKey(1));       // true
  print(map.containsKey(4));       // false

  print(map.containsValue('two')); // true
  print(map.containsKey('four')); // false
  
  map.forEach((key, value) => print("Key: $key and Value: $value"));

  var key = map.keys.firstWhere((k) => map[k] == 'two', orElse: () => null);
  print(key);
}

void addremove() {
  Map map = {1: '1st', 2: '2nd'};
  map[3] = '3rd'; print(map);
  map.putIfAbsent(3, () => '3rd');    //! Wouldn't
  map.putIfAbsent(4, () => '4th');    // Work
  print(map);
  
  map.addAll({5: '5th', 6: '6th'}); print(map);
  //Output:{1:1st, 2:2nd, 3:3rd, 4:4th, 5:5th, 6:6th}
  
  map.remove(4); print(map);

  map.removeWhere((k, v) => v.startsWith('5'));
  map.removeWhere((k, v) => v.endsWith('d'));
  print(map);

  map.clear(); print(map);
}

void merge() {
  Map map1 = {1: '1st', 2: '2nd'};
  Map map2 = {3: '3rd'};
  Map map3 = {4: '4th', 5: '5th'};

  // addAll() method
  var all = {}..addAll(map1)..addAll(map2)..addAll(map3);
  print(all);

  // from() and addAll() method
  var all2 = Map.from(map1)..addAll(map2)..addAll(map3);
  print(all2);

  // spread operator
  var all3 = {...map1, ...map2, ...map3};
  print(all3);
  
  map2 = null;
  // null-aware spread operator
  var all4 = {...?map1, ...?map2, ...?map3};
  print(all4);
}

void iterate() {
  Map map = {1: 'one', 2: 'two', 3: 'three'};

  map.forEach((k, v) {print('{ key: $k, value: $v }');});

  map.entries.forEach((e) {
    print('{ key: ${e.key}, value: ${e.value} }');});
  
  map.keys.forEach((k) => print(k));
  map.values.forEach((v) => print(v));
}

void sort() {
  Map map = {1:'one', 2:'two', 3:'three', 4:'four', 5:'five'};

  var sortedMap = Map.fromEntries(
    map.entries.toList()
    ..sort((e1, e2) => e1.value.compareTo(e2.value)));
  print(sortedMap);
}

void transform() {
  Map map = {1: 'one', 2: 'two', 3: 'three'};

  var transformedMap = map.map((k, v) {
    return MapEntry('-$k-', v.toUpperCase());
  });
  print(transformedMap);
}


void update(){
  Map map = {1: '1st', 2: '2nd'};
  map[1] = '1ST';
  print(map);
  
  map.update(2, (v) {print('Old value: ' + v);
  return '2ND';});
  print(map);
  
  map.update(3,(v) =>'3RD',ifAbsent:() =>'3rd');
  print(map);
  
  map.update(3,(v) =>'3RD',ifAbsent:() =>'3rd');
  print(map);
  
  
  Map mapU = Map.unmodifiable({1: 'one', 2: 'two'});
  // mapU[3] = 'three'; //! Error... Can't modify unmodifiable map
}

//!------------------------------------------------------