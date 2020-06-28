import 'package:flutter/material.dart';
import 'package:sellers_view/screens/AccountDetails/accdetails.dart';
import 'package:sellers_view/screens/CreateAd.dart';
import 'package:sellers_view/screens/SellerHome/sellerHome.dart';

import 'package:sellers_view/screens/chat.dart';


import '../Global.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({Key key, @required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 12.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: IconButton(
                icon: Icon(Icons.home),
                color: index == 1 ? primaryColor : null,
                onPressed: () {
                  if (index != 0)
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => SellerHome()));
                }),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: IconButton(
                icon: Icon(Icons.favorite),
                color: index == 2 ? primaryColor : Colors.grey,
                onPressed: () {
                  if (index != 0)
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => Chats()));
                }),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: IconButton(
                icon: Icon(Icons.shopping_cart),
                color: index == 3 ? primaryColor : Colors.grey,
                onPressed: () {
                  if (index != 3)
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => CreateAds()));
                }),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: IconButton(
                icon: Icon(Icons.account_circle),
                color: index == 4 ? primaryColor : Colors.grey,
                onPressed: () {
                  if (index != 4)
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => SellerDetails()));
                }),
          ),
        ],
      ),
    );
  }
}
