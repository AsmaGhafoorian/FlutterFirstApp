import 'package:first_flutter_app/albumView.dart';
import 'package:first_flutter_app/todo.dart';
import 'package:flutter/material.dart';

class TodoDetail extends StatelessWidget{

  static const routName = '/TodoDetail';
  final Todo todo;
  TodoDetail({Key key, @required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Go back!'),
            ),

            RaisedButton(
              onPressed: () {
                Navigator.pushNamed(context, AlbumView.routName);
              },
              child: Text('Fetch Data'),
            )

          ],
        )
      ),
    );
  }
}