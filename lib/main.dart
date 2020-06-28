import 'package:flutter/material.dart';
import 'Global.dart';
import 'screens/SellerHome/sellerHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: secondaryColor,
          scaffoldBackgroundColor: secondaryColor,
          cursorColor: primaryColor,
          appBarTheme: AppBarTheme(
            color: primaryColor,
            elevation: 4.0,
            textTheme: TextTheme(
              headline6: TextStyle(
              color: secondaryTextColor,
              fontSize: 18.0,
            )),
            iconTheme: IconThemeData(
              color: secondaryTextColor,
            ),
          )),
      home: SellerHome(),
    );
  }
}