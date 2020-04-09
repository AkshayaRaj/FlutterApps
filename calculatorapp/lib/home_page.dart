import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{

  @override
  State createState() => new HomePageState();
}

class HomePageState extends State<HomePage>{

  var num1 = 0, num2 = 2, ans = 0;
  final TextEditingController t1 = new TextEditingController(text: "0");
  final TextEditingController t2 = new TextEditingController(text: "0");

  void clear(){
    setState(() {
      num1 = 0;
      num2 = 0;
      t1.text = 0.toString();
      t2.text = 0.toString();
    });
  }

  void calculate(op){
    setState(() {
      num1 = int.parse(t1.text);
      num2 = int.parse(t2.text);
      switch (op) {
        case 0 :
          ans = num1 + num2;
          break;
        case 1 :
          ans = num1 - num2;
          break;
        case 2 :
          ans = num1 * num2;
          break;
        case 3 :
          ans = (num1 / num2).toInt() ;
          break;
        default:
      }
      
    });
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Calculator") ,
        ),
        body: new Container(
          padding: const EdgeInsets.all(40.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Answer: $ans",
              style: new TextStyle(
                fontSize: 20.0,
                color: Colors.purple[300],
                fontWeight: FontWeight.bold
              ),),
              new TextField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintText: "Enter Number 1"
                ),
                controller: t1,
              ),
              new TextField(
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  hintText: "Enter Number 2"
                ),
                controller: t2,
              ),
              new Padding(padding: const EdgeInsets.only(top: 20.0)),
              new Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: <Widget>[
                   new MaterialButton(
                     color: Colors.greenAccent,
                     onPressed:() => calculate(0), 
                     child: new Text("+"),
                     ),                  
                  new MaterialButton(
                     color: Colors.greenAccent,
                     onPressed:() => calculate(1),
                     child: new Text("-"),
                     ),                  
                  new MaterialButton(
                     color: Colors.greenAccent,
                     onPressed:() => calculate(2),
                     child: new Text("x"),
                     ),                  
                  new MaterialButton(
                     color: Colors.greenAccent,
                     onPressed:() => calculate(3),
                     child: new Text("/"),
                     ),
                 ],
              ),
              new Padding(padding: const EdgeInsets.only(top: 20.0)),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                new MaterialButton(
                     color: Colors.greenAccent,
                     onPressed:() => clear(),
                     child: new Text("CLEAR"),
                     ),
              ],)
            ],
          )
        ),
    );
  }
}