void operators() {
  print('-- Null Aware Operators--');               nullOperator();
  print('-- Casecade Operator --');                 casecadeOperator();
  print('-- Spread Operator--');                    spreadOperator();
}

//------------------------ Null Aware Operators ------------------------
//@ https://medium.com/@jelenaaa.lecic/what-are-in-dart-df1f11706dd6
void nullOperator() {
  nullOperator_1();
  nullOperator_2();
  nullOperator_3();
}

nullOperator_1() {                               //# ?? NULL Operator
  String name;                                   //# name is null by default.
	String nameToPrint = name ?? "Guest User";
	print(nameToPrint);                            //# Prints: Guest User

  print(0 ?? 1);                                 //# <- 0
  print(1 ?? null);                              //# <- 1
  print(null ?? null);                           //# <- null
  print(null ?? null ?? 2);                      //# <- 2
}

nullOperator_2() {                               //# ??= NULL Aware Assignment
  int value;
  print(value);                                  //# <- null
  value ??= 5;
  print(value);                                  //# <- 5, changed from null
  value ??= 6;
  print(value);                                  //# <- 5, no change
}

nullOperator_3() {                               //# NULL Aware Access
  String value;                                  //# <- value is null
  //! print(value.toLowerCase());                //! <- will crash
  //! print(value?.toLowerCase().toUpperCase()); //! <- will crash
  print(value?.toLowerCase()?.toUpperCase());    //# <- output is null
}

  //---------------------- Casecade Operator (..) ----------------------
void casecadeOperator() {
//Todo: Provide with some working example instead
//   //# Example 01
//    final addressBook = (AddressBookBuilder()          
//       ..name = 'jenny'                                
//       ..email = 'jenny@example.com'                   
//       ..phone = (PhoneNumberBuilder()                 
//             ..number = '415-555-0100'                 
//             ..label = 'home')                         
//           .build())                                   
//     .build();                                         
}

//----------------------- Spread Operator (...) -----------------------
//# A spread operator `...` (three-dots) when
//# placed before a List or a Set or an Iterable,
//# laid out individual elements of that collection.
//# Spread operator is relatively new and supported in v2.3

void spreadOperator() {
  exampleOne();
  exampleTwo();
  exampleThree();
}

//# Example 01:
//# Creating a new list from two or more individual lists.
void exampleOne() {
  List<String> list_1 = [ "Mango", "Banana", "Apple" ];
  List<String> list_2 = [ "Friends", "BBT", "Suits" ];

  //# create a new merged list (Old Way)
  List<String> listMergedOld = [];
  listMergedOld.addAll( list_1 );
  listMergedOld.addAll( list_2 );

  //# create a new merged list (New Way)
  List<String> listMergedNew = [ ...list_1, ...list_2 ];

  print( "Example-1 Old Way    :=> $listMergedOld"  );
  print( "Example-1 Using(...) :=> $listMergedNew"  );
}


//# Example 02:
//# Creating a list from an Iterable.
void exampleTwo() {
  List<int> numbers = [ 1, 2, 3, 4, 5, 6, 7, 8 ];

  //# creating a filtered list (old way)
  //# 'where' returns an Iterable object.
  List<int> filteredOld = numbers.where( ( number ) => number % 2 == 0 ).toList();

  //# creating a filtered list (new way)
  List<int> filteredNew = [ ...numbers.where( ( number ) => number % 2 == 0 ) ];

  print( "Example-2 Old Way    :=> $filteredOld"  );
  print( "Example-2 Using(...) :=> $filteredNew"  );
}

//# Example 03:
//@https://medium.com/@jelenaaa.lecic/what-are-in-dart-df1f11706dd6
//# Null Aware Spread Operator (...?)
void exampleThree() {
  List<int> list = [1, 2, 3];
  List<String> list2;                            //# <- list2 is null
  print(['chocolate', ...?list2]);               //# <- [chocolate]
  print([0, ...?list2, ...list]);                //# <- [0, 1, 2, 3]
  //! print(['cake!', ...list2]);                 //! <- will crash
}