

import 'package:flutter/material.dart';
import 'package:sellers_view/CustomWidgets/CustomScaffold.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(title: 'Settings' ,
     body: Container(color: Colors.greenAccent,), index: 6);
  }
}