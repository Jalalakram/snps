/*
- Functions in Dart are objects and have the type Function.
- Functions can be assigned to values,
- passed in function arguments,
- and used as function return values.
*/

/* 
- If no constructor is declared for a class, a default constructor with no arguments is provided.
- This default constructor simply invokes the no-argument constructor in the superclass.
- However, if a constructor is declared, this defaultcconstructor doesn’t exist...!
 */
//------------------ Naming convention -----------------
//@ https://medium.com/flutter-community/flutter-best-practices-and-tips-7c2782c9ebb5
/// Classes, enums, typedefs, and extensions name should in UpperCamelCase
class MainScreen { ... }
enum MainItem { .. }
typedef Predicate<T> = bool Function(T value);
extension MyList<T> on List<T> { ... }

/// Libraries, packages, directories, and source files name
/// should be in lowercase_with_underscores
library firebase_dynamic_links;
import 'socket/socket_manager.dart';

/// Variables, constants, parameters, and named parameters
/// should be in lowerCamelCase.
var item;
const bookPrice = 3.14;
final urlScheme = RegExp('^([a-z]+):');
void sum(int bookPrice) {...}
