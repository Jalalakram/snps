//@ https://medium.com/@jelenaaa.lecic/when-to-use-async-await-then-and-future-in-dart-5e00e64ab9b1
void futures() {
  // print('-- BASIC --');    basicExample(); 
  // print('-- AWAIT ---');   futureExample(); 
  // print('-- AWAIT ---');   awaitExample(); 
  // print('-- THEN ---');    thenExample(); 
  // print('-- ERROR ---');   errorExample(); 
}

void basicExample() async {
  print(getMeSomeFood());         
  print(await getMeSomethingBetter());       
  maybeSomethingSweet().then((String value) { print(value); });
  bye();
}

Future<String> getMeSomeFood() async { return "an apple"; }
Future<String> getMeSomethingBetter() async { return "a burger?"; }
Future<String> maybeSomethingSweet() async { return "a chocolate cake!!"; }
Future<void> bye() async{ print("see you soon!"); } //! No compile without async

//--------------------------- FUTURE ---------------------------
void futureExample() {
  print('Future being called...');
  print(proceedFuture());
  print('Future Proceeded Next Line');
}

Future<void> proceedFuture() {
  print('Future Just Started...');
  return Future.delayed(Duration(seconds: 5), () => print('Future Responded After 5 Sec.'));
}

//--------------------------- AWAIT ----------------------------
void awaitExample() async {
  print('Await being called...');
  print(await proceedAwait());
  print('Await Proceeded Next Line [Lately]');
}
Future<String> proceedAwait() {
  print('Await Just Started...');
  return Future.delayed(Duration(seconds: 5), () => "Await Responded After 5 Sec.");
}

//--------------------------- THEN -----------------------------
void thenExample() async {
  print('Then being called...');
  proceedThen().then((String value) => print(value));
  print('Then Proceeded Next Line [Instantly]');
}
Future<String> proceedThen() {
  print('Then Just Started...');
  return Future.delayed(Duration(seconds: 5), () => "Then Responded After 5 Sec at Last");
}

//--------------------------- ERROR ----------------------------
void errorExample() async {
  try{
    print('Error being called...');
    print(await proceedError());
    print('Error Proceeded Next Line [Skipped]');
  } catch (err) {
    print('Error Proceeding With Error');
    print(err);
  }
}
Future<String> proceedError() {
  print('Error Just Started...');
  return Future.delayed(Duration(seconds: 5), () => throw "Happened an Error.");
}