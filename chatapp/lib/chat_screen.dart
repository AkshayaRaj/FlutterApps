import 'package:chatapp/chat_message.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget{
  @override 
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {

  final TextEditingController _textController = new TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage> [];

  void _handleSubmitted(String text){
    _textController.clear(); 
    ChatMessage message = new ChatMessage(
      text: text,
    );
    setState(() {
      _messages.insert(0, message);
    });
    
  }

  Widget _textComposerWidget(BuildContext context){
    return new IconTheme(
        data: new IconThemeData(
          color: Theme.of(context).accentColor
        ),
          child: new Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: new Row(
          children: <Widget>[
            new Flexible(
              child: new TextField(
                      decoration: new InputDecoration.collapsed(
                      hintText: "Send a message"),
                      controller: _textController,
                      onSubmitted: _handleSubmitted,
                  )
            ),
            new Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              child: new IconButton(
                icon: new Icon(Icons.send),
                onPressed: () => _handleSubmitted(_textController.text),
                )
            )
          ]
        ),
      ),
    );
  }

  @override 
  Widget build(BuildContext context){
    return new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (context, index){
                final item = _messages[index];
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction){
                    //debugPrint(index.toString());
                    setState(() {
                      _messages.removeAt(index);
                    });
                    for(var msg in _messages){
                      debugPrint(msg.text);
                    }
                  },
                  child: item,
                );
                //return _messages[index];
              },
              itemCount: _messages.length,
            )
            ),
            new Divider(height: 1.0),
            new Container(
              decoration : new BoxDecoration(
                color: Theme.of(context).cardColor,
              ),
              child: _textComposerWidget(context),
            )
        ],
      );
  }
}