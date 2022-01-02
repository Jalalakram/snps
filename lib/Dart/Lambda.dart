/*
 # Fat-arrow function or lambda expession is a clean way
 # to write a function expression on a single line.
 # Fat-arrow functions doesn't have a statements body `{}`.
 # The statement body is replaced with `=>` fat-arrow which points to a single statement.
 # This statement is executed when the fat-arrow function is called and
 # it always returns the result of the statement execution.
 */

void lambda() {
  example01();
  example02();
  example03();
}

//# Automatically returns result of expression `a * a`
//# Data Types are inferred at runtime
void example01() {
  var getSquare = ( a ) => a * a; print( getSquare(3) );
}

//# Explicit Data Type declaration for the arguments
void example02() {
  var add = ( num a, num b ) => a + b; print( add(1, 2) );
}

//# Getter and Setters Using Lambda
void example03() {
  User()
    ..firstName = "Laxman"
    ..lastName = " Bhattarai"
    ..age = 18
    ..printUser();
}

class User {
  printUser() => print(fullName + " is a ${isAdult ? "Adult" : "Child"}");
  
  String firstName, lastName; DateTime birthday;

  String get fullName => firstName + lastName;
 
  set age(int age) => birthday = DateTime.now().subtract(Duration(days: age * 365));
  
  int get age => DateTime.now().year - birthday.year;
  
  bool get isAdult => age >= 18;
}
