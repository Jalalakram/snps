//@ Article Link: https://bezkoder.com/dart-list/
///# In Dart Arrays are Lists
void lists() {
  print('--CREATE--');          create(); 
  print('--ACCESS---');         access(); 
  print('--ADD-REMOVE--');      addremove(); 
  print('--MERGE--');           merge();
  print('--ITERATE--');         iterate();
  print('--SORT--');            sort();
  print('--TRANSFORM--');       transform();  
  print('--UPDATE--');          update();
}

void create() {
	List<int> numbersList = List(5);        //# Fixed-length list
  numbersList[0] = 73;                    //# Insert operation
	numbersList[1] = 64;
	numbersList[3] = 21;
	numbersList[4] = 12;
	numbersList[0] = 99;                    //# Update operation
	numbersList[1] = null;                  //# Delete operation

//# Growable List : METHOD 1
	List<String> countries = ["USA", "INDIA", "CHINA"];
	countries.add("Nepal");
	countries.add("Japan");

  //# Growable List: METHOD 2
	List<int> numbersList2 = List();
	numbersList2.add(73);    // Insert Operation
	numbersList2.add(64);
	numbersList2.add(21);
	numbersList2.add(12);

  var list1 = new List(); print(list1);  //# Growable List/Inferred
  List list2 = new List(); print(list2); //# Growable List
  //# Output: []

  var initialized = [1, 2, 3]; //# Growable Initialized
  initialized.add(4);
  initialized.add(null);
  print(initialized);
  //# Output: [1, 2, 3, 4, null]

  var fixedList1 = new List(3); print(fixedList1); //# Fixed List
  //# Output: [null, null, null]

  List<int> generic = List<int>(); print(generic.length); //# Typed List
  var inffered = <int>[]; print(inffered.length); //# Typed List

  //# List.filled() - by default, growable: false
  var filledList = List.filled(3, 1);
  print(filledList); //# Output: [1, 1, 1]
  // filledList.add(42); //! UnsupportedError

  var unmodifiableList = List.unmodifiable([true, false, true]); print(unmodifiableList);
  // unmodifiableList.add(42); //! UnsupportedError

  //# List.from([]) - by default, growable: true
  List fromList = List.from([1, 2, 3], growable: false);
  print(fromList); //# Output: [1, 2, 3]
  // fromList.add(42); //! UnsupportedError

  var genrateList = List.generate(5, (index) => index * 2);
  print(genrateList); //# Output: [0, 2, 4, 6, 8]

  //# DART LIST CONSTRUCTORS:
  //# initialize list in simple way using operator [].
  //# create and fill a list with specified value using filled() constructor.
  //# create a list containing all specified itemsusing from() constructor.
  //# create a ‘const’ list using unmodifiable() constructor.
  //# create and fill a list with values by a generator function using generate() constructor.
}

void access() {
  
}

void addremove() {
var myList = List(); myList.add(42); print(myList);          //# Growable List

var fixed = List(3); fixed[0] = 'one'; print(fixed.length);  //# Fixed length List
}

void merge() {
  
}

void iterate() {
  
}

void sort() {
  
}

void transform() {
  
}

void update() {
  
}