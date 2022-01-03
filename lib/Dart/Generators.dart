// ignore_for_file: avoid_print

void generators() {
  print('-- Sync Generator --');        syncGenerator(); 
  // print('-- Async Generator --');       asyncGenerator();
}

//------------------------- Sync Generator -----------------------
//@ https://medium.com/@codinghive.dev/async-coding-with-dart-generators-e2523901b34d
syncGenerator() {
  //# get SyncGenerator Iterable
  Iterable<int> syncGenerator=createSyncGenerator(15);
  
  print('Getting Iterator...');
  //use SyncGenerator
  Iterator<int> iterator=syncGenerator.iterator;
  
  print('Iterating Over...');
  while(iterator.moveNext()) {
    print('Iterating...');
    print('Generated: ' + iterator.current.toString());
    // print('Generated: $value');
  }

}

//# Create SyncGenerator
/// 1- Mark function with “ sync* ” defines function is generator and will return Iterable.
/// 2- Use “yeild” statement to deliver value.
Iterable<int> createSyncGenerator(int n) sync* {
  print('Generator Started...');
  int k = 0;
  print('Yielding...');
  while (k < n) {
    yield k++;
  }
  print('Stoping...');
}
//------------------------ Async Generator -----------------------
//@ https://medium.com/@codinghive.dev/async-coding-with-dart-generators-e2523901b34d
asyncGenerator() {
  //# Get Stream
  print('Getting Async Stream...');
  Stream<int> asyncGenerator=createAsyncGenerator(15);
  
  print('Listening Stream...');
  asyncGenerator.listen((int value) {
    print('Listening...');
    print('Generated: $value');
  });
}

//# Create AsyncGenerator
/// 1- Mark function with “ async* ” defines function is generator and will return Stream.
/// 2- Use “yeild” statement to emit value in stream.
Stream<int> createAsyncGenerator(int n) async* {
  print('Generator Started...');
  int k = 0;
  print('Yielding...');
  while (k < n) {
    yield k++;
  }
  print('Stoping...');
}