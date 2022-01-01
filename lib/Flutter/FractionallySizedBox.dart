//@ https://codepen.io/erluxman/pen/rNOLOzG?__cf_chl_jschl_tk__=07f15888166037dfdb8954981da9aca133ea9dea-1589847555-0-AYCWVoCYkBgxP5PHccu0bhRAamFQiOpNewfHgKU2EOTP3bw-tX-pt_urBBG0yQiC3i12nMOBAwJNsFE97-M4oslpMyWHeThKoZsc_whmwwICRjgKkEi2B0nkMubbZu8yvxolm7hbrAjBvQzvLEOb1LgKu6zo0AZ56vdtsMRUce3m1tKLt8gjEgqHEMvdp2ECu8rYoGu0j1O55Ni2IzsMzr_k6m2lgPxi3tGQhKHwG69gvfndUM_2ZbP8EadlM9TeO-g3Gi_0GL9NIgPXvViNZ6Y-8rZiEI-WeGpeb-RpfAJTF7ZnkOld7xMSA8cSwuJ7JoWSM6UQ_YMwHQO3Lg0OFhGF2ReltFazeR-wDYJREqpr
import 'package:flutter/material.dart';

void fractionallySizedBox() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: MyWidget(),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
            widthFactor: 0.5,
            heightFactor: 0.5,
            child: Container(
              color: Colors.green,
            ),
      
      
      
          );
  }
}