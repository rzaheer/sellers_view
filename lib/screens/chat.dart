import 'package:flutter/material.dart';
import 'package:sellers_view/CustomWidgets/CustomScaffold.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'CHAT',
      body: Text('CHAT HERE'), 
      index: 2
      );
  }
}