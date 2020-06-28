import 'package:flutter/material.dart';
import 'package:sellers_view/CustomWidgets/CustomScaffold.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(title: 'HISTORY' ,
     body: Container(color: Colors.greenAccent,), index: 5);
  }
}