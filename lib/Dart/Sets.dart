//-- Unordered Collection
//-- All elements are unique

void sets() {
  print('--CREATE--'); create(); 
  print('--ACCESS---'); access(); 
  print('--ADD-REMOVE--'); addremove(); 
  print('--MERGE--'); merge();
  print('--ITERATE--'); iterate();
  print('--SORT--'); sort();
  print('--TRANSFORM--'); transform();  
  print('--UPDATE--'); update();
}

void create() {
  //# Method 1: From a list
	Set<String> countries = Set.from(["USA", "INDIA", "CHINA"]);
	countries.add("Nepal");
	countries.add("Japan");

  //# Method 2: Using Constructor
	Set<int> setOne = Set();
	setOne.add(73);       //# Insert Operation
	setOne.add(64);
	setOne.add(21);
	setOne.add(12);

	setOne.add(73);       //# Duplicate entries are ignored

	for (int element in setOne) {   //# Using Individual Element ( Objects )
		print(element);
	}

	setOne.forEach((element) => print(element));   //# Using Lambda

  setOne.contains(73);  //# returns true if the element is found in set
	setOne.remove(64);    //# returns true if the element was found and deleted
	setOne.isEmpty;       //# returns true if the Set is empty
	setOne.length;        //# returns number of elements in Set
	setOne.clear();       //# Deletes all elements
}

void access() {
	Set<String> countries = Set.from(["USA", "PAKISTAN", "CHINA"]);

	for (String element in countries) {  //# Using Individual Element ( Objects )
		print(element);
	}

	countries.forEach((element) => print(element));   //# Using Lambda
}

void addremove() {
  var emails = new Set();
  emails.add('bob@example.com');
  emails.add('jhon@example.com');
  emails.add('bob@example.com'); ///# Duplicate Ignored
  emails.remove('jhon@example.com');
  print(emails.length == 1);
}

void merge() {
  Set<String> poolA = Set.from(["USA", "PAKISTAN", "CHINA"]);
  Set<String> poolB = Set.from(["PAKISTAN", "GB", "RUSSIA"]);

  print(poolA.intersection(poolB)); //# Prints PAKISTAN
}

void iterate() {
  
}

void sort() {
  
}

void transform() {
  
}

void update() {
  
}