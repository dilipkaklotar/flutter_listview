import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter ListView Example',
    home: Scaffold(

      appBar: AppBar(
        title: Text('Flutter ListView Example'),
      ),
      body: getListView(),
      floatingActionButton: FloatingActionButton(
         child: Icon(Icons.add),
          onPressed: (){
      }),
    ),
  ));
}

List<String> getListItems() {
  var items = List <String>.generate(100,(counter) => 'Item $counter');
  return  items;
}


Widget getListView() {
  var listItems = getListItems();

  var listview = ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.accessibility_new),
          title: Text(listItems[index]),

          onTap: () {
            _showDialog(context, '${listItems[index]} Clicked');
          },
        );
      });

  return listview;
}

void showSnakeBar(BuildContext context, String text) {
  var snakeBar = SnackBar(
      content: Text(text),
    action: SnackBarAction(label: 'UNDO', onPressed: (){
      debugPrint('Dummy UNDO Perform');
    }),
  );
  Scaffold.of(context).showSnackBar(snakeBar);
}

void _showDialog(BuildContext context,String message) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: new Text("Item Clicked"),
        content: new Text(message),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}