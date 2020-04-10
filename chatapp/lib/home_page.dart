import 'package:chatapp/chat_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chat UI")
      ),
      body: new ChatScreen()
    );
  }

}