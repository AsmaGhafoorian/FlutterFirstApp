import 'package:flutter/material.dart';

class TodoDetailArguments {
  final String title;
  final String message;

  TodoDetailArguments(this.title, this.message);
}

class TodoDetail extends StatelessWidget{

  static const routName = '/TodoDetail';
  @override
  Widget build(BuildContext context) {

    final TodoDetailArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title),
      ),
      body: Center(
        child: Text(args.message),
      ),
    );
  }
}