import 'package:flutter/material.dart';
import 'package:sellers_view/CustomWidgets/Textfields.dart';
import 'package:flutter/services.dart';
import 'package:sellers_view/Global.dart';

import 'PostAd2.dart';

class PostAd extends StatefulWidget {
  @override
  _PostAdState createState() => _PostAdState();
}

class _PostAdState extends State<PostAd> {
  //final _formKey = GlobalKey<FormState>();
  String error = '';

  // text field state
  String category = '';
  String weight = '';
  String price = '';
  String expectedWeight = '';

  var categories = [
    "Cow",
    "Goat",
    "Camel",
    "Sheep",
    "Ram",
  ];

  String dropdownValue = 'Select Category';

  String description='';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
            appBar: AppBar(leading: IconButton(
           icon: Icon(Icons.arrow_back, color: primaryColor,),
           onPressed: (){
              Navigator.of(context).pop(); },
            ),
            backgroundColor: secondaryColor,
            title:Text ('Create new ad', 
            style: TextStyle(fontSize: 20, 
            fontWeight: FontWeight.bold, 
            color: primaryColor),),
            ),

     body: SingleChildScrollView(
            child: Padding(
         padding: const EdgeInsets.all(12.0),
         child: Column(
          
   children: <Widget>[
SizedBox(height: 20,),

// CATEGORY DROPDOWN Form field
 DropdownButtonFormField<String>(

    decoration: textInputDecoration ,
    value: dropdownValue,
    icon: Icon(Icons.arrow_drop_down),
    iconSize: 20,
    elevation: 26,

    style: TextStyle(
    color: Colors.black,
   // fontSize: 20, 
   ),
    onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
    },
    items: <String>['Select Category', 'Cow', 'Goat',  'Camel',  'Sheep', 'Ram']
          .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(

              value: value,
              child: Text(value),
            );
          })
          .toList(),
  ),
Container( height: 18.0,
                  padding: EdgeInsets.only(right: 250),
                child: Text('*required', style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ), ),),
SizedBox(height: 25.0),

    //for weight

TextFormField(
   keyboardType: TextInputType.number,
  decoration: textInputDecoration.copyWith(hintText: 'Weight of Animal(Kgs) '),
  obscureText: false,
  inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly],
   onChanged: (val) {
    setState(() => weight = val);},
   ),

Container( height: 18.0,
                  padding: EdgeInsets.only(right: 250),
                child: Text('*required', style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ), ),),
//For expected meat weight

                          SizedBox(height: 25.0),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: textInputDecoration.copyWith(
                            hintText: 'Expected Meat Weight(Kgs)'),
                            obscureText: false,
                            inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly],
                            onChanged: (val) {
                              setState(() => expectedWeight = val);
                            },
                          ),
                  Container( height: 18.0,
                  padding: EdgeInsets.only(right: 250),
                child: Text('*required', style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ), ),),

//for price
                          SizedBox(height: 25.0),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: textInputDecoration.copyWith(hintText: 'Price of Animal'),
                            obscureText: false,
                            inputFormatters: <TextInputFormatter>[
          WhitelistingTextInputFormatter.digitsOnly
],
                            onChanged: (val) {
                              setState(() => price = val);
                            },
                          ),

                          Container( height: 18.0,
                  padding: EdgeInsets.only(right: 250),
                child: Text('*required', style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ), ),),

SizedBox(height: 25.0),
                          TextFormField(
                           
                            keyboardType: TextInputType.multiline ,
                            decoration: textInputDecoration.copyWith(hintText: 'Add description of your animal'),
                            obscureText: false,
                            onChanged: (val) {
                              setState(() => description = val);
                            },
                          ),

                          Container( height: 18.0,
                  padding: EdgeInsets.only(right: 250),
                child: Text('*required', style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ), ),),

                          SizedBox(height: 30.0),
                          RaisedButton(
                            color: Colors.indigo,
                            child: Text(
                              'NEXT',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                            ),
                            onPressed: () { 
           Navigator.push(context,
           MaterialPageRoute(builder: (context) => StepTwo())); }
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            error,
                            style: TextStyle(color: Colors.red, fontSize: 14.0),
                          )
                        ],
                      ),
       ),
     ),

            ),
      );
  }
}