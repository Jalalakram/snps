//? Article Link: https://bezkoder.com/dart-convert-list-map/
//? Map <---> List

// List of Customers
[{ Jack, 23 }, { Adam, 27 }, { Katherin, 25 }]

// Map { name:age }
Map map = {'Jack': 23, 'Adam': 27, 'Katherin': 25};


//# Use Literal Initialization rather than with Constructors
// Good
var points = [];
var addresses = {};

// Bad
var points = List();
var addresses = Map();


// With type argument

// Good
var points = <Point>[];
var addresses = <String, Address>{};

// Bad
var points = List<Point>();
var addresses = Map<String, Address>();