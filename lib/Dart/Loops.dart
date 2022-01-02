void loops() {
  print('-- Loop Break --');      loopBreak();
  print('-- Loop Continue --');   loopContinue();
  print('-- Loop For --');        loopFor();
  print('-- Loop For In --');     loopForIn();
  print('-- While Loop --');      loopWhile();
  print('-- Do While Loop --');   loopDoWhile();
}

void loopBreak() {
  //# BREAK keyword
	//# Using Labels for Loops i.e. innerLoop:, myOuterLoop: etc.
	// Nested FOR Loop

	myOuterLoop: for (int i = 1; i <= 3; i++) {

		innerLoop: for (int j = 1; j <= 3; j++) {
			print("Outer:$i Inner:$j");

			if (i == 2) {
				break innerLoop;
			}
		}
	}
}

void loopContinue() {
	//# CONTINUE keyword
	//# Using Labels for Loops i.e. myLoop:, myInnerLoop: etc.

  	myLoop: for (int i = 1; i <= 3; i++) {
      myInnerLoop: for (int j = 1; j <= 3; j++) {
        if (i == 2 && j == 2) {
          continue myLoop;
        }
        print("Outer:$i  Inner:$j");
      }
	}
}

void loopFor() {
  for (int i = 1; i <= 10; i++) {
		if ( i % 2 == 0) { print(i); }
	}
}

void loopForIn() {
  List planetList = ["Mercury", "Venus", "Earth", "Mars"];
	for (String planet in planetList) {
		print(planet);
	}
}

void loopWhile() {
  var  i = 1;
	while (i <= 10) {
		if (i % 2 == 0) { print(i); }
		i++;
	}
}

void loopDoWhile() {
 	int i = 1;
	do {
		if ( i % 2 == 0) { print(i); }
		i++;
	} while ( i <= 10);
}