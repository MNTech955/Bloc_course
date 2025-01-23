import 'package:bloc_course/bloc/todo/todo_bloc/todo_bloc.dart';
import 'package:bloc_course/bloc/todo/todo_bloc/todo_event.dart';
import 'package:bloc_course/bloc/todo/todo_bloc/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Todo App"),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if(state.toDoList.isEmpty){
            return Center(child: Text("No data found"),);
          }else if(state.toDoList.isNotEmpty){
              return ListView.builder(
              itemCount: state.toDoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.toDoList[index].toString()),
                  trailing:
                      IconButton(onPressed: () {
                        context.read<TodoBloc>().add(RemoveToDoEvent(task: state.toDoList[index]));
                        

                      }, icon: Icon(Icons.delete)),
                );
              }
              );

          }else{
            return SizedBox();
          }
        
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for(int i=0; i<5; i++ ){
            context.read<TodoBloc>().add(AddToDoEvent(task: "Task:$i"));

          }
         
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
