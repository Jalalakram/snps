/* 
 # Functions behave like first-class objects meaning they can be STORED in a variable,
 # PASSED as an argument or RETURNED like a normal return value of a function.
 # In Dart, functions can be defined in the file scope or inside another function.
 # Since everything is an object in Dart, function behaves like first-class objects.
 # Functions can be stored in a variable, passed as an argument or returned as a value.
 # Functions defined in the file scope, like `main` function are hoisted.
 # Hence we can call one function from another despite their order on appearance in the file.
 
 # A function that takes a function as an argument or returns
 # a functionas a result value called a Higher-Order Function.
 # Creating a higher-order function in Dart is very simple
 # as functions in Dart are first-class objects.
 */

void functions() {
  f0();       //# Call Function as Parameter
}

//------------------- Passing Function as Parameter -------------------
void f0() {
  f2(f1, 3);
  f2(f1, 4);
  f2(f1, 7);
  f2(f1, 9);
}

f1(int evenOrOdd) {
  print("$evenOrOdd is ${evenOrOdd % 2 == 0 ? "Even" : "Odd"}");
}

f2(Function(int) evenOrOddFunction, int argumentToPass) {
  evenOrOddFunction(argumentToPass);
}