
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sellers_view/CustomWidgets/CircularButton.dart';
import 'package:sellers_view/CustomWidgets/CustomScaffold.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sellers_view/Global.dart';
import 'package:sellers_view/screens/AccountDetails/Faqs.dart';
import 'package:sellers_view/screens/AccountDetails/History.dart';
import 'package:sellers_view/screens/AccountDetails/Settings.dart';


class SellerDetails extends StatefulWidget {
  @override
  _SellerDetailsState createState() => _SellerDetailsState();
}

class _SellerDetailsState extends State<SellerDetails> {
  List arr=['Your Orders','Settings','FAQ','About Us', 'Log out'];

//To import picssss
  Future<File> imageFile;
 
  pickImageFromGallery(ImageSource source) {
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
    }
  
  Widget showImage() {
    return FutureBuilder<File>(
      future: imageFile,
      builder: (BuildContext context, AsyncSnapshot<File> snapshot) {
        if (snapshot.connectionState == ConnectionState.done &&
            snapshot.data != null) {
          return Image.file(
            snapshot.data,
            width: 300,
            height: 300,
          );
        } else if (snapshot.error != null) {
          return const Text(
            'Error Picking Image',
            textAlign: TextAlign.center,
          );
        } else {
          return const Text(
            'No Image Selected',
            textAlign: TextAlign.center,
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
    title: null,
    index : 4,
    body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Card(
                elevation: 3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    //SizedBox(width: 3),
                    Stack(children: <Widget>[
                 Container(
                        height: MediaQuery.of(context).size.height/6,
                        width: MediaQuery.of(context).size.width/3,
                        color: Colors.pink, ),
                         Positioned(
                              child: CircularButton(
                                radius: 5,
                                icon: Icon(
                                  Icons.edit,
                                  color: Colors.red,
                                  size: 10,
                                ),
                                onPressed: () => {
                                  pickImageFromGallery(ImageSource.gallery),
                                },
                              ),
                              bottom: 0.0,
                              right: 0.0,
                              left: 30.0,
                            ),
                    ], 
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // yeh database se aega code accordingly
                          Text('Username',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          Text('xyz@abc.com',
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          Text('Phone number here',
                              style: TextStyle(
                                fontSize: 18,
                              )),
                          SizedBox(height: 10),
                          RaisedButton(
                              elevation: 8,
                              textColor: Colors.white,
                              color: Colors.blue[400],
                              onPressed: () async {},
                              child: Text('Switch to buyer mode',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold))),
                        ],
                      ),
                    ),
                    ],
                    ),),
                    ListTile(
                    leading:Icon(Icons.history, color: primaryColor,),
                    title: Text('History'), 
                    onTap: () { 
       Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (context) => History())); }
                    ),
                    Divider(),
              ListTile(
                    leading:Icon(Icons.settings, color: primaryColor,),
                    title: Text('Settings'), 
                    onTap: () { 
       Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (context) => Settings())); }
                    ),
                    Divider(),
              ListTile(
                    leading:Icon(Icons.question_answer, color: primaryColor,),
                    title: Text('FAQs'), 
                    onTap: () { 
       Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (context) => Faqs())); }
                    ),
               
                    Divider(),
              ListTile(
                    leading:Icon(Icons.warning, color: primaryColor,),
                    title: Text('About Us'), 
                    onTap: () { 
       Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (context) => Faqs())); }
                    ),
                    Divider(),
                     ListTile(
                    title: Text('LOG OUT', style: TextStyle( 
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent

                    ),), 
                    onTap: () { 
       Navigator.pushReplacement(context,
       MaterialPageRoute(builder: (context) => Faqs())); }
                    ),
                    Divider(),




                    
                  ],
                ),
              ),
    );
  }
}
