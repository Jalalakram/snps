//@ https://medium.com/flutter-community/dart-generics-4a980f44186e
// ignore_for_file: avoid_print

import 'dart:collection';

//# E: E is used to represent the element type in a collection like List.
//# K: K is used to represent the key type in associative collections like Map.
//# V: V is used to represent the value type in associative collections like Map.
//# R: R is used to represent the return type of a method or function.
///
// Demonstrating single letter vs descriptive names for generics.
// Both variations have the same results.

void generics() {
  //# Example 01: Demonstrating use of single letter and descriptive words for generics
  Product milk = Product(1, 5.99, "Milk");
  Product bread = Product(2, 4.50, "Bread");

  // Using single letter names for Generics
  Store<Product, Inventory> store1 = Store<Product, Inventory>();
  store1.updateInventory(milk, Inventory(20));
  store1.updateInventory(bread, Inventory(15));
  store1.printProducts();

  // Using descriptive names for Generics
  MyStore<Product, Inventory> store2 = MyStore<Product, Inventory>();
  store2.updateInventory(milk, Inventory(20));
  store2.updateInventory(bread, Inventory(15));
  store2.printProducts();

  //# Example 02: Generics methods
  // Function's return type (T).
  // Function's argument (List<T>).
  // Function's local variable (T last).
  T lastItem<T>(List<T> products) {
    T last = products.last;
    return last;
  }

  Store<Product, Inventory> store3 = Store<Product, Inventory>();
  store3.updateInventory(milk, Inventory(20));
  store3.updateInventory(bread, Inventory(15));

  // Data type of `Product` is being used
  Product product = lastItem(store3.products);
  print("Last item of Product type: $product");

  // Demonstrating using another type of data on same `lastItem()` method.
  List<int> items = List<int>.from([1, 2, 3, 4, 5]);
  int item = lastItem(items);
  print("Last item of int type: $item");
}

// A class for grocery product
class Product {
  final int id;
  final double price;
  final String title;
  Product(this.id, this.price, this.title);

  @override
  String toString() {
    return "Price of ${this.title} is \$${this.price}";
  }
}

// A class for product's inventory
class Inventory {
  final int amount;

  Inventory(this.amount);

  @override
  String toString() {
    return "Inventory amount: $amount";
  }
}

// Custom type variables- Single letter
class Store<P, I> {
  final HashMap<P, I> catalog = HashMap<P, I>();

  List<P> get products => catalog.keys.toList();

  void updateInventory(P product, I inventory) {
    catalog[product] = inventory;
  }

  void printProducts() {
    catalog.keys.forEach(
      (product) => print("Product: $product, " + catalog[product].toString()),
    );
  }
}

// Custom type variables- Descriptive
class MyStore<MyProduct, MyInventory> {
  final HashMap<MyProduct, MyInventory> catalog =
      HashMap<MyProduct, MyInventory>();

  List<MyProduct> get products => catalog.keys;

  void updateInventory(MyProduct product, MyInventory inventory) {
    catalog[product] = inventory;
  }

  void printProducts() {
    catalog.keys.forEach(
      (product) => print("Product: $product, " + catalog[product].toString()),
    );
  }
}

//# Output:
//# Product: Price of Bread is $4.5, Inventory amount: 15
//# Product: Price of Milk is $5.99, Inventory amount: 20
//# Product: Price of Bread is $4.5, Inventory amount: 15
//# Product: Price of Milk is $5.99, Inventory amount: 20

//# Last item of Product type: Price of Bread is $4.5
//# Last item of int type: 5