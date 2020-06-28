import 'package:flutter/material.dart';
import '../Global.dart';
import 'CustomButtomNavbar.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final int index;
  const CustomScaffold({
    @required this.title,
    @required this.body,
    @required this.index,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(index);
    if (index == 5) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
          actions: <Widget>[
            FlatButton(
                color: secondaryColor,
                onPressed: () {},
                child: Row(
                  children: <Widget>[
                    Text(
                      'Filter',
                      style: TextStyle(color: primaryColor),
                    ),
                    IconButton(
                        icon: Icon(Icons.filter_list),
                        color: primaryColor,
                        onPressed: () {})
                  ],
                )),
          ],
        ),
        body: body,

        // bottomNavigationBar: CustomNavbar(index: index),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text('Online Mandi'),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: DataSearch());
                }),
            IconButton(icon: Icon(Icons.notifications), onPressed: () {})
          ],
        ),
        body: body,
        bottomNavigationBar: CustomNavbar(index: index),
        floatingActionButton: index == 3
            ? FloatingActionButton.extended(
                onPressed: () {},
                backgroundColor: Colors.orange,
                label: Text('Checkout'),
                icon: Icon(Icons.payment),
                foregroundColor: Colors.white,
              )
            : null,
        floatingActionButtonLocation:
            index == 3 ? FloatingActionButtonLocation.centerFloat : null,
      );
    }
  }
}

class DataSearch extends SearchDelegate<String> {
  final items = ['Goats', 'Cows', 'Sheep', 'Camel', 'Ram', 'Ox', 'Bufallo'];
  final recentItems = [
    'Goats',
    'Cows',
    'Sheep',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for appbar
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading for appbar
    return IconButton(
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {

  }

  @override
  Widget buildSuggestions(BuildContext context) {
    
    final suggestionList = query.isEmpty ? recentItems : items;
    return ListView.builder(
        itemCount: suggestionList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.history),
            title: Text(suggestionList[index]),
          );
        });
  }
}
