/*
------------closure, also Lexical closure or Function closure--------------
#  Dart functions have lexical scope which means a function has
#  access to the variable defined in the upper/parent scopes.
#  
#  When a function is nested inside another function, inner function has
#  access to the variables defined in the parent function.
#
#  Like JavaScript, Dart creates `closures` to hold variables from the outer scope
#  that the function depends on.
 */

void lexicalClosures() {
  lexicalClosureExample();
  closures();
}

void lexicalClosureExample() {
  //|-------------- example of lexical scoping-----------------
  //# variable `name` is accessible inside `getUpperCase`
  var name = 'Ross Geller';

  var getUpperCase = () {
    print( name.toUpperCase() ); //# `name` is accessed from upper scope(s)
  };

  //# lexical scoping calling
  getUpperCase(); //# Prints: ROSS GELLER

  //|------------------ example of closure---------------------
  //# return function creates a closure with `i`
  //# hence `i` lives even when `addANumber` is returned
  var addANumber = ( num i ) {
    return ( num j ) => i + j; //# Return a function that adds argument i = 2 with j = 3
  };
  var addTwo = addANumber( 2 ); // `addANumber` function is returned

  //# closure
  print("addTwo(3) :=> ${addTwo(3)}");  //# Prints: 5
}

//@ https://www.youtube.com/watch?v=NaxyY2Rq0j8
 void closures() {

	//# Definition 1:
	//# A closure is a function that has access to the parent scope, even after the scope has closed.
	String message = "Dart is good";

	Function showMessage = () {
		message = "Dart is awesome";
		print(message);
	};

	showMessage();


	//# Definition 2:
	//# A closure is a function object that has access to variables in its lexical scope,
	//# even when the function is used outside of its original scope.
	Function talk = () {

		String msg = "Hi";

		Function say = () {
			msg = "Hello";
			print(msg);
		};

		return say;
	};

	Function speak = talk();

	speak();  //# speak() // talk() // say()  //  print(msg)  // "Hello"
}