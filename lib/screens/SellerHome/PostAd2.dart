import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sellers_view/CustomWidgets/Textfields.dart';
import '../../Global.dart';
import 'package:multi_image_picker/multi_image_picker.dart';

import 'viewImages.dart';

class StepTwo extends StatefulWidget {
  
  @override
  _StepTwoState createState() => _StepTwoState();
   static File imageFile;
}

class _StepTwoState extends State<StepTwo> {
  List<Asset> images = List<Asset>();  
  String _error = 'No Error Dectected';
  String address = '';

  @override  void initState() {
  super.initState();  }

   Widget buildGridView() {
    return GridView.count(
     crossAxisCount: 3,     
      children: List.generate(images.length, (index) {
        Asset asset = images[index];        
        return ViewImages(
          index,asset,key: UniqueKey(),);
        }), );}


  Future<void> loadAssets() async {
    setState(() {
      images = List<Asset>();    });
    List<Asset> resultList = List<Asset>();    
    String error = 'No Error Dectected';
    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,        
        enableCamera: false,        
        options: CupertinoOptions(takePhotoIcon: "chat"),);} 
        on PlatformException catch (e) {
      error = e.message;    }
    if (!mounted) return;
    setState(() {
      images = resultList;     
     _error = error;    });  }

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
                    SizedBox(height: 25.0),
                              TextFormField(
                                maxLines: null,
                                keyboardType: TextInputType.multiline ,
                                decoration: textInputDecoration.copyWith(hintText: 'Enter your Address'),
                                obscureText: false,
                                onChanged: (val) {
                                  setState(() => address = val);
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
//IMAGE ADD
        Padding(padding: EdgeInsets.all(8.0),
        child: FlatButton.icon(

          icon: Icon(Icons.add), 
          label: Text('Upload photos of your animal',
          style: TextStyle(color: Colors.grey),),
          focusColor: Colors.indigo,
           onPressed:(){
            _showImageDialog(context);
            },),
        ),
        Center(
              child:Container(
              padding: EdgeInsets.all(10.0),                
              child: Text('Error: $_error',style: TextStyle(

                    fontWeight: FontWeight.w900,                   
                     fontStyle: FontStyle.italic               
                      ),),               
                       decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),                  
                  border: Border.all(color: Color(0x0FF000000))
),  ), ),            
Expanded(
child: buildGridView(),           
),

     SizedBox(height: 20.0),
                          RaisedButton(
                            color: Colors.indigo,
                            child: Text(
                              'Done',
                              style: TextStyle(color: Colors.white),
                            ),
                            onPressed: () {
                    SnackBar s=SnackBar(content:Text("response recorded"),duration:Duration(milliseconds: 2),
                      backgroundColor:Colors.indigoAccent,);
                    Scaffold.of(context).showSnackBar(s);
                  },
                          ),
                          SizedBox(height: 12.0),

                        ],
                      ),
       ),
     ),
                  ),
    );
  }

Future<void> _showImageDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true, //on true,dialog disappears by clicing anywhere on the screen
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Import from'),
          content: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Column(
                    children: <Widget>[
IconButton(
icon: Icon(Icons.camera , size: 20,), 
onPressed:  () {
camera(context);
},),
Text('Camera', ),
 ],),),

 SizedBox(
 height: 100,  width: 100,
child: Column(
children: <Widget>[
IconButton(
icon: Icon(Icons.photo_library , size: 20,), 
onPressed: loadAssets,
),
Text('Gallery', ),
 ],),),
               
               // IconButton(icon:Icon(Icons.clear),onPressed:(){
               //   Navigator.of(context).pop();
              //  } ,),
              ],
            ),
          ),
        );
      },
    );
  }

camera(BuildContext context)async{
    var image=await ImagePicker.pickImage(source:ImageSource.camera);
    this.setState((){
    StepTwo.imageFile=image;
   // Navigator.of(context).pop;
    }
    );
   //removes the alert dialog context
  }
}