import 'package:flutter/material.dart';
import 'package:sellers_view/CustomWidgets/CustomScaffold.dart';


class SellerHome extends StatefulWidget {
  @override
  _SellerHomeState createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      index: 1,
      title: 'HOME/MY ADS',
      body: Text('displays ads here'),);
     }
     } 