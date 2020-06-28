import 'package:flutter/material.dart';

 final textInputDecoration = InputDecoration(
  fillColor: Colors.indigo[70],

  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  isDense: false,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.blueGrey, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.indigo, width: 3.0),
  ),
);