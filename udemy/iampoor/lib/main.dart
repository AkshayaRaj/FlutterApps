import 'package:flutter/material.dart';

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyanAccent[400],
        appBar: AppBar(
          title: const Text("I Am Poor"),
          backgroundColor: Colors.teal[800]
        ),
        body: Center(
          child: Align(
              alignment: Alignment(0.0, -0.1),
              child: Image(
                      height: 200.0,
                      image: AssetImage('images/coal.png')
            ),
          ),
        ),
      ) ,
      ),
  );
}