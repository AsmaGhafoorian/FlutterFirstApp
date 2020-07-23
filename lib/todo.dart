
import 'package:first_flutter_app/todoDetail.dart';
import 'package:flutter/material.dart';

class TodoArguments {
  final String title;

  TodoArguments(this.title);
}

class TodosScreen extends StatelessWidget {


   List<Todo> todos = List<Todo>.generate(20, (i) => Todo(
     'Todo $i',
     'A description of what needs to be done for Todo $i',
    ),
   );

   @override
  Widget build(BuildContext context) {
     final TodoArguments arg = ModalRoute.of(context).settings.arguments;

      return Scaffold(
        appBar: AppBar(
          title: Text(arg.title),
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(todos[index].title),
              onTap:() {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TodoDetail(todo : todos[index]),
                  )
                );
              }
            );
          }
        ),
      );
  }
}

class Todo{
  final String title;
  final String description;

  Todo(this.title, this.description);
}