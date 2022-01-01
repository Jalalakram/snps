//@ https://medium.com/better-programming/how-to-implement-the-delegation-design-pattern-in-dart-d782de77c886
//# How to Implement the Delegation Design Pattern in Dart

void delegationDesignPattern() {
  final manager = Manager();
  final worker = Worker();
  
  worker.delegate = manager;
  worker.doWork();
}

mixin WorkerDelegate {
  void onWorkDone();
}

class Manager with WorkerDelegate {
  
  void onWorkDone() {
    print("Work was done");
  }
  
}

class Worker {
  WorkerDelegate delegate;
  
  void doWork() {
    delegate.onWorkDone();
  }
}

