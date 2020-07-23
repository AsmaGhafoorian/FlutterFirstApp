
import 'package:first_flutter_app/todoDetail.dart';
import 'package:flutter/material.dart';

class TodosScreen extends StatelessWidget {
   List<Todo> todos = List<Todo>.generate(20, (i) => Todo(
     'Todo $i',
     'A description of what needs to be done for Todo $i',
    ),
   );

   @override
  Widget build(BuildContext context) {

      return Scaffold(
        appBar: AppBar(
          title: Text('Todos'),
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(todos[index].title),
              onTap:() {
                Navigator.pushNamed(
                  context,
                  TodoDetail.routName,
                  arguments: TodoDetailArguments(
                    todos[index].title,
                    todos[index].description,
                  ),
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