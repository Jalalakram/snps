
// * Enumerations
enum TrafficColor { red, green, yellow }

//!------------------------------------------------------

// * TypeDef is an alias of a function type.
// * Here Processor<T> defined to take a value <T> and return void.
typedef Processor<T> = void Function(T value);

void process<T>(List<T> list, Processor<T> action) {
    list.forEach((item) {
        print('Processing $item..');
        action(item);
    });
}

void main() {
    process([1, 2, 3], print);
}

//!------------------------------------------------------

// * Runes values returns emoticons
var value = '\u{1F686} \u{1F6B4}';
print(value);

//!------------------------------------------------------

//? Casecade Operator
//? Dart has a special cascade operator (..)
class User {
  String name, email;
  Address address;
  void sayHi() => print('hi, $name');
}
  
class Address {
  String street, suburb, zipCode;
  void log() => print('Address: $street, $suburb, $zipCode');
}

void main() {
  User()
  ..name = 'Alex'
  ..email = 'alex@example.org'
  ..address = (Address()
    ..street = 'my street'
    ..suburb = 'my suburb'
    ..zipCode = '1000'
    ..log())
  ..sayHi();
}
//!------------------------------------------------------

//? Optional Arguments:
//? Person constructor where 'salary' is optional argument
class Person{
  String name;
  num salary
  Person(this.name, {this.salary});
} 