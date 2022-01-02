//@ https://dev.to/graphicbeacon/top-10-string-utility-methods-you-should-know-dart--4df0
//# Top 10 String utility methods you should know (Dart)

var str1 = 'Lorem';
var str2 = '$str1 ipsum'; // String interpolation
var str3 = '''Multi
           Line
           $str1 $str2'''; // Multi-line strings

// 1. contains()
// This allows you to check whether the specified string exists:
str1.contains('rem'); // true
// 2. startsWith()
// This allows you to check whether the string starts with the specified characters:
str2.startsWith('Lorem'); // true
str3.startsWith('Noorem'); // false
// 3. endsWith()
// Checks whether the string ends with the specified characters:
str3.endsWith('ipsum'); // true
str3.endsWith('oopsum'); // false
// 4. toLowerCase(), toUpperCase()
// Converts the string to lowercase and uppercase formats:
str1.toLowerCase(); // lorem
str1.toUpperCase(); // LOREM
// 5. split()
// Splits the string at the matching pattern, returning a list of substrings:
str3.split('\n'); // ['Multi', 'Line', 'Lorem Lorem ipsum'];
// 6. splitMapJoin()
// Splits the string, converts each list item, and combines them into a new string:
str3.splitMapJoin(RegExp(r'^', multiLine: true), // Matches the beginning of each line
  onMatch: (m) => '**${m.group(0)} ', // Adds asterisk to the line beginning
  onNonMatch: (n) => n); // Leaves non matches as is
/*
Output: 

** Multi
** Line
** Lorem Lorem ipsum

*/
// 7. indexOf(), lastIndexOf()
// Returns the position of the first and last matches of the given pattern:
str3.indexOf('rem'); // 13
str3.lastIndexOf('rem'); // 19
// Both methods also take in an optional parameter specifying the index to begin the search from:
str3.lastIndexOf('rem', 18); // 13
// 8. trim()
// Removes leading and trailing whitespaces:
"   $str2  ".trim(); // 'Lorem ipsum'
// 9. padLeft(), padRight()
// Pads the string on the left and right with the given padding if the string is less that the specified length:
str1.padLeft(8, 'x'); // xxLorem
str1.padRight(8, 'x'); // Loremxx
// 10. replaceAll()
// Replaces all substrings that match the specified pattern with the replacement string:
str2.replaceAll('e', 'é'); // Lorém
