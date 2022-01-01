void regExp() {
    var readLines = [
    'Dart is fun',
    'It is easy to learn'
  ];

  for (String line in readLines) {
    String split = line.replaceAll(new RegExp(r'\s+'), '\n');
    print(split);
  }  
}