import 'package:uuid/uuid.dart';

void constructors() {
  print('-- Factory Constructor --');     factoryConstructor(); 
  // print('-- AWAIT ---');               futureExample(); 
  // print('-- AWAIT ---');               awaitExample(); 
  // print('-- THEN ---');                thenExample(); 
  // print('-- ERROR ---');               errorExample(); 
}

//------------------------ Initializer lists ----------------------
//@ https://dart.dev/codelabs/dart-cheatsheet#initializer-lists

class FirstTwoLetters {
  final String letterOne;
  final String letterTwo;

  FirstTwoLetters(String word)
      : letterOne = word[0],
        letterTwo = word[1];
}

//------------------------ Named constructors ---------------------
//@ https://dart.dev/codelabs/dart-cheatsheet#named-constructors

class Color {
  int red;
  int green;
  int blue;
  
  Color(this.red, this.green, this.blue);

  Color.black() {
    red = 0;
    green = 0;
    blue = 0;
  } 
}

//---------------------- Factory constructors ---------------------
//# Example 01
//@ https://dart.dev/codelabs/dart-cheatsheet#factory-constructors

class Square extends Shape {}

class Circle extends Shape {}

class Shape {
  Shape();

  factory Shape.fromTypeName(String typeName) {
    if (typeName == 'square') return Square();
    if (typeName == 'circle') return Circle();

    print('I don\'t recognize $typeName');
    return null;
  }
}

//# Example 02
//@ https://medium.com/run-dart/dart-dartlang-introduction-advanced-dart-features-524de79456b9

// execution entry function
void factoryConstructor() {

  // create `Person` object with id `1`
  Person p1 = Person( 1, 'John' );
  print( 'p1 : $p1' );

  // create another `Person` object with id `1`
  Person p2 = Person( 1, 'Mike' );
  print( 'p2 : $p2' );

  // create `Person` object with id `2`
  Person p3 = Person( 2, 'Mike' );
  print( 'p3 : $p3' );

}

// unique identifier generator object
var uuidGenerator = Uuid();

/*
 * A `factory function` is a function that returns an instance of a class.
 * Dart provides `factory` keyword to label a default or named constructor.
 * Then it becomes our responsibility to return an instance from this constructor.
 * 
 * A factor constructor is generally used to control the instance creation.
 * For example, we can cache an instance of the class and return the same instance
 * when a user is trying to create new object.
 */
class Person {
  int id;
  String name;
  String uuid; // A random identifier to represent unique instance

  // `cache` map contains instances of the `Person` class labeled by `id` field
  // `final` protects `_cache` from being overridden accidentally
  static final Map<int, Person> _cache = {};

  // factory constructor does not have access to `this` object.
  factory Person( int id, String name ) {

    // if `_cache` does not have a value with `id` key,
    // then create a new instance of the `Person` class, store it in the `_cache` map
    print( 'Creating new instance with id: $id name:$name' );
    if( ! _cache.containsKey( id ) ) {

      // create new instance
      var uuid = uuidGenerator.v4(); // assign new UUID string
      var instance = Person._createInstance( id, name, uuid ); // use named constructor to create an instance

      // cache instance
      _cache[ id ] = instance;
    }

    // return cached instance
    return _cache[ id ];
  }

  // named constructor to create an instance of `Person` class
  // it should start with `_` prefix to make it inaccessible outside the library
  Person._createInstance( this.id, this.name, this.uuid );

  // string representation
  @override
  String toString() {
    return 'id: ${ this.id }, name: ${ this.name }, uuid: ${ this.uuid }';
  }
}

//--------------------------------- Const Constructors ---------------------------------
//@ https://dart.dev/codelabs/dart-cheatsheet#const-constructors

class ImmutablePoint {
  //# const keyword defines ImmutablePoint as Const Constructor
  const ImmutablePoint(this.x, this.y);

  final int x;
  final int y;

  //# initialize object origin with const parameter values
  static const ImmutablePoint origin = ImmutablePoint(0, 0);
}

//-------------------------------- Redirecting constructors ------------------------------
//@ https://dart.dev/codelabs/dart-cheatsheet#redirecting-constructors

class Automobile {
  String make;
  String model;
  int mpg;

  // The main constructor for this class.
  Automobile(this.make, this.model, this.mpg);

  // Delegates to the main constructor.
  Automobile.hybrid(String make, String model) : this(make, model, 60);

  // Delegates to a named constructor
  Automobile.fancyHybrid() : this.hybrid('Futurecar', 'Mark 2');
}