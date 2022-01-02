import 'dart:math';

//* INHERITANCE
void oop() {
  var rectangle = Rectangle(100, 50);
  var square = Square(50);
  var circle = Circle(50);
  print(rectangle.area()); print(square.area()); print(circle.area());
}

//* Abstract Parent Class
abstract class Shape { double area(); }

//*
class Circle extends Shape {
  double radius;
  Circle(this.radius);

  @override
  double area() {return pi * radius * radius;}
}

class Rectangle extends Shape {
  double width, height;
  Rectangle(this.width, this.height);

  @override
  double area() {return width * height;}
}
//* Calls Rectangle.area() method with width parameter twice
class Square extends Rectangle {
  Square(double width) : super(width, width);
}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

// * FACTORY in Flutter
class ExpensiveObject {
  static ExpensiveObject _instance;
  ExpensiveObject._create() {
    print('created');
  }
  
  factory ExpensiveObject() {
    if (_instance == null) {
      _instance = ExpensiveObject._create();
    }
    return _instance;
  }
}

void maiiiiiiiiiiiiin() {
    ExpensiveObject(); // create new object
    ExpensiveObject(); // factory returns existing
}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

//* MIXINS
class Person {
  String name;
  Person(this.name);
}

class Student extends Person with CardHolder {
  Student(String name) : super('Student: $name') {
    holder = this;
  }
}

class Teacher extends Person with CardHolder {
  Teacher(String name) : super('Teacher: $name') {
    holder = this;
  }
}

mixin CardHolder {
  Person holder;
  void swipeCard() {
    print('${holder.name} swiped the card');
  }
}

mixin SystemUser {
  Person user;
  void useSystem() {
    print('${user.name} used the system.');
  }
}

class Assistant extends Teacher with SystemUser {
  Assistant(String name) : super(name) {
    user = this;
  }
}

void maiiiiiiiin() {
  var assistant = Assistant('Alex');
  assistant.swipeCard();
  assistant.useSystem();
}

//!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!