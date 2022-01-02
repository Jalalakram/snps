import 'package:meta/meta.dart';

void parameters() {
   print('-- Defalut Parameter --');      defalutParameter();
   print('-- Optional Parameter --');     optionalParameter();
   print('-- Named Parameter --');        namedParameter();
   print('-- @required Annotation --');   requiredAnnotatoin();
}

//--------------------------------------- Default Parameter Values -----------------------------------------
void defalutParameter() {
	findVolume(10);                         //# Default value comes into action
	findVolume(10, breadth: 5, height: 30); //# Overrides value. Name is a must!
	findVolume(10, height: 30, breadth: 5); //# Named Parameters with Default values
}

void findVolume(int length, {int breadth = 2, int height = 20}) {
	print("Lenght is $length");
	print("Breadth is $breadth");
	print("Height is $height");
	print("Volume is ${length * breadth * height}");
}

//------------------ Optional Positional Parameters [] -----------------

//# By default, all named arguments of a function are optional
//# and their default values, if not provided, are `null`.

void optionalParameter() {
	printCountries("USA");  //# Could skip Optional Positional Parameters
}

void printCountries(String name1, [String name2, String name3]) {
	print("Name 1 is $name1");
	print("Name 2 is $name2");
	print("Name 3 is $name3");
}

//-------------------------- Named Parameter {} ------------------------
void namedParameter(){
	findVolume2(10, breadth: 5, height: 20);
	findVolume2(10, height: 20, breadth: 5);  //# Sequence doesn't matter
}

void findVolume2(int length, {int breadth, int height}) {
	print("Length is $length");
	print("Breadth is $breadth");
	print("Height is $height");

	print("Volume is ${length * breadth * height}");
}

//---------------------------------------- @required Annotation  {} -----------------------------------------
//@ https://medium.com/run-dart/dart-dartlang-introduction-advanced-dart-features-524de79456b9
//# Using `@required` annotation from the `meta` package, named parameters can be marked required.
//# We just need to place it before the parameter declaration.

void requiredAnnotatoin() {
  Person p = Person( firstName: 'John', lastName: 'Doe' );
  print( 'Full Name => ${ p.firstName + ' ' + p.lastName }' );
}

class Person{
  String firstName, lastName;
  Person( { @required this.firstName, @required this.lastName } );
}
