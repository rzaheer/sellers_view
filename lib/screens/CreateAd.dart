import 'package:flutter/material.dart';
import 'package:sellers_view/CustomWidgets/CustomScaffold.dart';
import 'package:sellers_view/screens/SellerHome/PostAd.dart';


class CreateAds extends StatefulWidget {
  @override
  _CreateAdsState createState() => _CreateAdsState();
}

class _CreateAdsState extends State<CreateAds> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      index: 3,
      title:'Create new Ads' , 
      body: 
        Column(
          children: <Widget>[
            SizedBox(height: MediaQuery.of(context).size.height/3),
            Center( 
              child: 
              SizedBox(
                  child: Text('Tap to Create a New Ad', 
                  style: TextStyle( 
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[600],  fontSize: 20) ,),
                ),
            ),
            SizedBox(height: 20,),
            
                   CircleAvatar(
                          backgroundColor: Colors.indigo,
                          radius: 30,

                          child: IconButton(icon: Icon(Icons.add, size: 17,color: Colors.white,), onPressed: () { 
       Navigator.push(context,
       MaterialPageRoute(builder: (context) => PostAd())); }),
                        ),
          ],
        ),
          );
  }
}